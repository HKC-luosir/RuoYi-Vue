package com.ruoyi.project.benyi.service;

import java.util.List;
import com.ruoyi.project.benyi.domain.ByCalendar;

/**
 * 园历管理(本一)Service接口
 * 
 * @author tsbz
 * @date 2020-05-10
 */
public interface IByCalendarService 
{
    /**
     * 查询园历管理(本一)
     * 
     * @param id 园历管理(本一)ID
     * @return 园历管理(本一)
     */
    public ByCalendar selectByCalendarById(Long id);

    /**
     * 查询园历管理(本一)列表
     * 
     * @param byCalendar 园历管理(本一)
     * @return 园历管理(本一)集合
     */
    public List<ByCalendar> selectByCalendarList(ByCalendar byCalendar);

    /**
     * 新增园历管理(本一)
     * 
     * @param byCalendar 园历管理(本一)
     * @return 结果
     */
    public int insertByCalendar(ByCalendar byCalendar);

    /**
     * 修改园历管理(本一)
     * 
     * @param byCalendar 园历管理(本一)
     * @return 结果
     */
    public int updateByCalendar(ByCalendar byCalendar);

    /**
     * 批量删除园历管理(本一)
     * 
     * @param ids 需要删除的园历管理(本一)ID
     * @return 结果
     */
    public int deleteByCalendarByIds(Long[] ids);

    /**
     * 删除园历管理(本一)信息
     * 
     * @param id 园历管理(本一)ID
     * @return 结果
     */
    public int deleteByCalendarById(Long id);
}
