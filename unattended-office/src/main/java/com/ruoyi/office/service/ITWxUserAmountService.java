package com.ruoyi.office.service;

import java.util.List;
import com.ruoyi.office.domain.TWxUserAmount;

/**
 * 微信用户余额Service接口
 * 
 * @author ruoyi
 * @date 2023-05-30
 */
public interface ITWxUserAmountService 
{
    /**
     * 查询微信用户余额
     * 
     * @param id 微信用户余额主键
     * @return 微信用户余额
     */
    public TWxUserAmount selectTWxUserAmountById(Long id);

    /**
     * 查询微信用户余额列表
     * 
     * @param tWxUserAmount 微信用户余额
     * @return 微信用户余额集合
     */
    public List<TWxUserAmount> selectTWxUserAmountList(TWxUserAmount tWxUserAmount);

    /**
     * 新增微信用户余额
     * 
     * @param tWxUserAmount 微信用户余额
     * @return 结果
     */
    public int insertTWxUserAmount(TWxUserAmount tWxUserAmount);

    /**
     * 修改微信用户余额
     * 
     * @param tWxUserAmount 微信用户余额
     * @return 结果
     */
    public int updateTWxUserAmount(TWxUserAmount tWxUserAmount);

    /**
     * 批量删除微信用户余额
     * 
     * @param ids 需要删除的微信用户余额主键集合
     * @return 结果
     */
    public int deleteTWxUserAmountByIds(Long[] ids);

    /**
     * 删除微信用户余额信息
     * 
     * @param id 微信用户余额主键
     * @return 结果
     */
    public int deleteTWxUserAmountById(Long id);

    void minusCardValue(TWxUserAmount wxUserAmount);
}
