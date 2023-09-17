package com.ruoyi.office.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import com.ruoyi.office.domain.TJoinUs;

/**
 * 我要加盟Mapper接口
 *
 * @author ruoyi
 * @date 2023-09-17
 */
public interface TJoinUsMapper extends BaseMapper<TJoinUs> {
    /**
     * 查询我要加盟
     *
     * @param id 我要加盟主键
     * @return 我要加盟
     */
    public TJoinUs selectTJoinUsById(Long id);

    /**
     * 查询我要加盟列表
     *
     * @param tJoinUs 我要加盟
     * @return 我要加盟集合
     */
    public List<TJoinUs> selectTJoinUsList(TJoinUs tJoinUs);

    /**
     * 新增我要加盟
     *
     * @param tJoinUs 我要加盟
     * @return 结果
     */
    public int insertTJoinUs(TJoinUs tJoinUs);

    /**
     * 修改我要加盟
     *
     * @param tJoinUs 我要加盟
     * @return 结果
     */
    public int updateTJoinUs(TJoinUs tJoinUs);

    /**
     * 删除我要加盟
     *
     * @param id 我要加盟主键
     * @return 结果
     */
    public int deleteTJoinUsById(Long id);

    /**
     * 批量删除我要加盟
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTJoinUsByIds(Long[] ids);
}
