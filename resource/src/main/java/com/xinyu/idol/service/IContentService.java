package com.xinyu.idol.service;

import com.aliyuncs.exceptions.ClientException;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.xinyu.idol.pojo.entity.ContentEntity;
import com.baomidou.mybatisplus.extension.service.IService;
import com.xinyu.idol.pojo.vo.*;
import org.springframework.web.multipart.MultipartFile;

import javax.swing.plaf.IconUIResource;
import java.io.IOException;
import java.util.List;

/**
 * <p>
 * 资源冗余大表 服务类
 * </p>
 *
 * @author yu.li
 * @since 2023-10-17
 */
public interface IContentService extends IService<ContentEntity> {

    List testList();

    void addContent(AddContentVo addContentVo);

    IPage<PageContentResp> pageContent(PageContentReq pageContentReq);

    /**
     * 从web后台更新数据
     * @param updateContentWebListReq
     */
    void updateContent(UpdateContentWebListReq updateContentWebListReq);

    /**
     * 后台上传icon
     * @param multipartFile
     * @return
     * @throws ClientException
     * @throws IOException
     */
     FileUploadResp uploadIcon(MultipartFile multipartFile) throws ClientException, IOException;

     void pullResourceFromEnv(PullResourceFromEnvReq pullResourceFromEnvReq);


}
