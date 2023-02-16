package com.ruoyi.contest.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.contest.domain.Award;
import com.ruoyi.contest.domain.vo.SaveAwardVo;

import java.util.List;

/**
 * 获奖登记Service接口
 *
 * @author lsyonlygoddes
 * @date 2023-02-14
 */
public interface IAwardService extends IService<Award>
{
    /**
     * 查询获奖登记列表
     *
     * @param award 获奖登记
     * @return 获奖登记集合
     */
    public List<Award> selectAwardList(Award award);

    int saveAward(SaveAwardVo vo);
}
