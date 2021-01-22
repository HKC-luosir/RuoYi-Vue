package com.gox.system.service.impl;

import java.io.*;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import cn.hutool.core.codec.Base64;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.lang.Assert;
import cn.hutool.crypto.SecureUtil;
import com.gox.common.utils.file.FileUtils;
import com.gox.common.utils.file.MergeRunnable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import com.gox.system.mapper.ElectronicAttributesMapper;
import com.gox.system.domain.ElectronicAttributes;
import com.gox.system.service.IElectronicAttributesService;
import org.springframework.web.multipart.MultipartFile;

/**
 * 电子文件信息Service业务层处理
 * 
 * @author gox
 * @date 2020-12-29
 */
@Service
public class ElectronicAttributesServiceImpl implements IElectronicAttributesService 
{
    private static final Logger LOGGER= LoggerFactory.getLogger(ElectronicAttributesServiceImpl.class);
    @Autowired
    private ElectronicAttributesMapper electronicAttributesMapper;
    @Value("${system.rootpath}")
    String rootpath;
    /**
     * 查询电子文件信息
     * 
     * @param id 电子文件信息ID
     * @return 电子文件信息
     */
    @Override
    public ElectronicAttributes selectElectronicAttributesById(Long id)
    {
        return electronicAttributesMapper.selectElectronicAttributesById(id);
    }
    /**
     * 文件分块合并存储
     * @param map
     */
    @Override
    public String mergeChunk(Map<String, Object> map){
        try{
            StringBuilder path = new StringBuilder(rootpath);
            path.append(File.separator).append("temp");
            MultipartFile file = (MultipartFile) map.get("data");
            //先校验md5 若有问题 直接提示失败 并重传
            String md5 = String.valueOf(map.get("chunkMd5"));
            String nmd5 = SecureUtil.md5(file.getInputStream());
            if (!nmd5.equals(md5)){
                LOGGER.error("md5不匹配");
                return "md5不匹配,上传失败";
            }
            String filename = String.valueOf(map.get("filename"));
            filename = FileUtil.getPrefix(filename);
            path.append(File.separator).append(filename);
            File folder = new File(path.toString());
            if (!folder.exists()){
                folder.mkdirs();
            }
            path.append(File.separator).append("blob-"+map.get("chunkIndex"));
            file.transferTo(Paths.get(path.toString()));
        }
        catch (Exception e){
            LOGGER.error("系统错误",e);
            return "发生异常"+e.getMessage();
        }
        return "";
    }
    @Override
    public boolean merge(String filename, String md5,Long metadataId){
        StringBuilder path1 = new StringBuilder(rootpath);
        String filena = FileUtil.getPrefix(filename);
        path1.append(File.separator).append("temp").append(File.separator).append(filena).append(File.separator);
        String folder = path1.toString();
        String targetFile = rootpath + File.separator + "temp" + File.separator + filename;
        try {
            File f = new File(folder);
            String [] adds = f.list();
            Comparator<String> comparator = (o1, o2) -> {
                String [] os1 =o1.split("-");
                String [] os2 = o2.split("-");
                return Integer.parseInt(os1[1])-Integer.parseInt(os2[1]);
            };
            int partFileSize = 5 * 1024 * 1024;
            if (adds != null) {
                RandomAccessFile randomAccessFile = new RandomAccessFile(targetFile,
                        "rw");
                randomAccessFile.setLength(partFileSize * (adds.length - 1)
                        + adds[(adds.length - 1)].length());
                randomAccessFile.close();
                Arrays.sort(adds,comparator);
                ThreadPoolExecutor threadPool = new ThreadPoolExecutor(
                        adds.length, adds.length * 3, 1, TimeUnit.SECONDS,
                        new ArrayBlockingQueue<>(adds.length * 2));
                for (int i = 0; i < adds.length; i++) {
                    File partFile = new File(folder+adds[i]);
                    threadPool.execute(new MergeRunnable(i * partFileSize,
                            targetFile, partFile));
                }
                threadPool.shutdown();
                while (true){
                    if (threadPool.isTerminated()){
                        break;
                    }
                }
                File reFile =new File(targetFile);
                String md = SecureUtil.md5(reFile);
                if (md.equals(md5)){
                    ElectronicAttributes ea = new ElectronicAttributes(reFile,metadataId);
                    int res= electronicAttributesMapper.insertElectronicAttributes(ea);
                    if (res==0){
                        //删除文件
                        reFile.delete();
                    }
                }
            }
        } catch (Exception e) {
            LOGGER.error("系统错误",e);
            return false;
        }
        return true;
    }
    /**
     * 获取文件base64编码
     *
     * @param id 电子文件id
     */
    @Override
    public String getBase64(String id) {
        ElectronicAttributes ea = electronicAttributesMapper.selectElectronicAttributesById(Long.valueOf(id));
        String path = ea.getCurrentLocation();
        if (FileUtil.exist(path)){
            try {
                return FileUtils.base64(path);
            } catch (IOException e) {
                e.printStackTrace();
                return "";
            }
        }
        return "";
    }

    /**
     * 查询电子文件信息列表
     * 
     * @param electronicAttributes 电子文件信息
     * @return 电子文件信息
     */
    @Override
    public List<ElectronicAttributes> selectElectronicAttributesList(ElectronicAttributes electronicAttributes)
    {
        return electronicAttributesMapper.selectElectronicAttributesList(electronicAttributes);
    }

    /**
     * 新增电子文件信息
     * 
     * @param electronicAttributes 电子文件信息
     * @return 结果
     */
    @Override
    public int insertElectronicAttributes(ElectronicAttributes electronicAttributes)
    {
        return electronicAttributesMapper.insertElectronicAttributes(electronicAttributes);
    }

    /**
     * 修改电子文件信息
     * 
     * @param electronicAttributes 电子文件信息
     * @return 结果
     */
    @Override
    public int updateElectronicAttributes(ElectronicAttributes electronicAttributes)
    {
        return electronicAttributesMapper.updateElectronicAttributes(electronicAttributes);
    }

    /**
     * 批量删除电子文件信息
     * 
     * @param ids 需要删除的电子文件信息ID
     * @return 结果
     */
    @Override
    public int deleteElectronicAttributesByIds(Long[] ids)
    {
        return electronicAttributesMapper.deleteElectronicAttributesByIds(ids);
    }

    /**
     * 删除电子文件信息信息
     * 
     * @param id 电子文件信息ID
     * @return 结果
     */
    @Override
    public int deleteElectronicAttributesById(Long id)
    {
        return electronicAttributesMapper.deleteElectronicAttributesById(id);
    }
}
