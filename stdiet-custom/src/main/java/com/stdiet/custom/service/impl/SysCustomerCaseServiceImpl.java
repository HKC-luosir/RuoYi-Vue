package com.stdiet.custom.service.impl;

import java.util.ArrayList;
import java.util.List;
import com.stdiet.common.utils.DateUtils;
import com.stdiet.custom.domain.SysCustomerCaseFile;
import com.stdiet.custom.mapper.SysCustomerCaseFileMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.stdiet.custom.mapper.SysCustomerCaseMapper;
import com.stdiet.custom.domain.SysCustomerCase;
import com.stdiet.custom.service.ISysCustomerCaseService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 客户案例管理Service业务层处理
 *
 * @author xiezhijun
 * @date 2021-03-04
 */
@Service
@Transactional
public class SysCustomerCaseServiceImpl implements ISysCustomerCaseService
{
    @Autowired
    private SysCustomerCaseMapper sysCustomerCaseMapper;

    @Autowired
    private SysCustomerCaseFileMapper sysCustomerCaseFileMapper;

    /**
     * 查询客户案例管理
     *
     * @param id 客户案例管理ID
     * @return 客户案例管理
     */
    @Override
    public SysCustomerCase selectSysCustomerCaseById(Long id)
    {
        return sysCustomerCaseMapper.selectSysCustomerCaseById(id);
    }

    /**
     * 查询客户案例管理列表
     *
     * @param sysCustomerCase 客户案例管理
     * @return 客户案例管理
     */
    @Override
    public List<SysCustomerCase> selectSysCustomerCaseList(SysCustomerCase sysCustomerCase)
    {
        return sysCustomerCaseMapper.selectSysCustomerCaseList(sysCustomerCase);
    }

    /**
     * 新增客户案例管理
     *
     * @param sysCustomerCase 客户案例管理
     * @return 结果
     */
    @Override
    public int insertSysCustomerCase(SysCustomerCase sysCustomerCase)
    {
        sysCustomerCase.setCreateTime(DateUtils.getNowDate());
        int rows = sysCustomerCaseMapper.insertSysCustomerCase(sysCustomerCase);
        if(rows > 0){
            //批量添加文件对应列表
            SysCustomerCaseFile caseFile = null;
            if(sysCustomerCase.getCaseFileUrl() != null && sysCustomerCase.getCaseFileUrl().length > 0){
                List<SysCustomerCaseFile> caseFileList = new ArrayList<>();
                for (String url : sysCustomerCase.getCaseFileUrl()) {
                    caseFile = new SysCustomerCaseFile();
                    caseFile.setCaseId(sysCustomerCase.getId());
                    caseFile.setFileName(sysCustomerCase.getCaseFileName()[caseFileList.size()]);
                    caseFile.setFileUrl(url);
                    caseFileList.add(caseFile);
                }
                rows = sysCustomerCaseFileMapper.insertBatch(caseFileList);
            }
        }
        return rows;
    }

    /**
     * 修改客户案例管理
     *
     * @param sysCustomerCase 客户案例管理
     * @return 结果
     */
    @Override
    public int updateSysCustomerCase(SysCustomerCase sysCustomerCase)
    {
        sysCustomerCase.setUpdateTime(DateUtils.getNowDate());
        return sysCustomerCaseMapper.updateSysCustomerCase(sysCustomerCase);
    }

    /**
     * 批量删除客户案例管理
     *
     * @param ids 需要删除的客户案例管理ID
     * @return 结果
     */
    @Override
    public int deleteSysCustomerCaseByIds(Long[] ids)
    {
        int rows = sysCustomerCaseMapper.deleteSysCustomerCaseByIds(ids);
        if(rows > 0){
            rows = sysCustomerCaseFileMapper.deleteSysCustomerCaseFileByCaseIds(ids);
        }
        return rows;
    }

    /**
     * 删除客户案例管理信息
     *
     * @param id 客户案例管理ID
     * @return 结果
     */
    @Override
    public int deleteSysCustomerCaseById(Long id)
    {
        int rows = sysCustomerCaseMapper.deleteSysCustomerCaseById(id);
        if(rows > 0){
            rows = sysCustomerCaseFileMapper.deleteSysCustomerCaseFileByCaseId(id);
        }
        return rows;
    }

    /**
     * 根据案例ID获取对应文件列表
     * @param caseId
     * @return
     */
    public List<SysCustomerCaseFile> getFileListByCaseId(Long caseId){
        return sysCustomerCaseFileMapper.selectSysCustomerCaseFileListByCaseId(caseId);
    }
}