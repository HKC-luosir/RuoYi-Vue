package com.ruoyi.office.service;

import java.util.List;
import com.ruoyi.office.domain.TStorePromotion;

/**
 * 优惠券 t_store_promotionService接口
 * 
 * @author ruoyi
 * @date 2023-06-14
 */
public interface ITStorePromotionService 
{
    /**
     * 查询优惠券 t_store_promotion
     * 
     * @param id 优惠券 t_store_promotion主键
     * @return 优惠券 t_store_promotion
     */
    public TStorePromotion selectTStorePromotionById(Long id);

    /**
     * 查询优惠券 t_store_promotion列表
     * 
     * @param tStorePromotion 优惠券 t_store_promotion
     * @return 优惠券 t_store_promotion集合
     */
    public List<TStorePromotion> selectTStorePromotionList(TStorePromotion tStorePromotion);

    /**
     * 新增优惠券 t_store_promotion
     * 
     * @param tStorePromotion 优惠券 t_store_promotion
     * @return 结果
     */
    public int insertTStorePromotion(TStorePromotion tStorePromotion);

    /**
     * 修改优惠券 t_store_promotion
     * 
     * @param tStorePromotion 优惠券 t_store_promotion
     * @return 结果
     */
    public int updateTStorePromotion(TStorePromotion tStorePromotion);

    /**
     * 批量删除优惠券 t_store_promotion
     * 
     * @param ids 需要删除的优惠券 t_store_promotion主键集合
     * @return 结果
     */
    public int deleteTStorePromotionByIds(Long[] ids);

    /**
     * 删除优惠券 t_store_promotion信息
     * 
     * @param id 优惠券 t_store_promotion主键
     * @return 结果
     */
    public int deleteTStorePromotionById(Long id);
}
