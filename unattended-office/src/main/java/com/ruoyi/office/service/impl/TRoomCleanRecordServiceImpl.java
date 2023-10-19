package com.ruoyi.office.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.office.domain.enums.OfficeEnum;
import com.ruoyi.office.domain.vo.CleanRecordH5Vo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.office.mapper.TRoomCleanRecordMapper;
import com.ruoyi.office.domain.TRoomCleanRecord;
import com.ruoyi.office.service.ITRoomCleanRecordService;

/**
 * 房间打扫记录Service业务层处理
 *
 * @author ruoyi
 * @date 2023-09-30
 */
@Service
public class TRoomCleanRecordServiceImpl extends ServiceImpl<TRoomCleanRecordMapper, TRoomCleanRecord> implements ITRoomCleanRecordService {
    @Autowired
    private TRoomCleanRecordMapper tRoomCleanRecordMapper;

    /**
     * 查询房间打扫记录
     *
     * @param id 房间打扫记录主键
     * @return 房间打扫记录
     */
    @Override
    public TRoomCleanRecord selectTRoomCleanRecordById(Long id) {
        return tRoomCleanRecordMapper.selectTRoomCleanRecordById(id);
    }

    /**
     * 查询房间打扫记录列表
     *
     * @param tRoomCleanRecord 房间打扫记录
     * @return 房间打扫记录
     */
    @Override
    public List<TRoomCleanRecord> selectTRoomCleanRecordList(TRoomCleanRecord tRoomCleanRecord) {
        return tRoomCleanRecordMapper.selectTRoomCleanRecordList(tRoomCleanRecord);
    }

    /**
     * 新增房间打扫记录
     *
     * @param tRoomCleanRecord 房间打扫记录
     * @return 结果
     */
    @Override
    public int insertTRoomCleanRecord(TRoomCleanRecord tRoomCleanRecord) {
        tRoomCleanRecord.setCreateTime(DateUtils.getNowDate());
        return tRoomCleanRecordMapper.insertTRoomCleanRecord(tRoomCleanRecord);
    }

    /**
     * 修改房间打扫记录
     *
     * @param tRoomCleanRecord 房间打扫记录
     * @return 结果
     */
    @Override
    public int updateTRoomCleanRecord(TRoomCleanRecord tRoomCleanRecord) {
        tRoomCleanRecord.setUpdateTime(DateUtils.getNowDate());
        return tRoomCleanRecordMapper.updateTRoomCleanRecord(tRoomCleanRecord);
    }

    /**
     * 批量删除房间打扫记录
     *
     * @param ids 需要删除的房间打扫记录主键
     * @return 结果
     */
    @Override
    public int deleteTRoomCleanRecordByIds(Long[] ids) {
        return tRoomCleanRecordMapper.deleteTRoomCleanRecordByIds(ids);
    }

    /**
     * 删除房间打扫记录信息
     *
     * @param id 房间打扫记录主键
     * @return 结果
     */
    @Override
    public int deleteTRoomCleanRecordById(Long id) {
        return tRoomCleanRecordMapper.deleteTRoomCleanRecordById(id);
    }


    @Override
    public List<CleanRecordH5Vo> selectTRoomCleanRecordH5List(CleanRecordH5Vo tRoomCleanRecord) {

        final List<CleanRecordH5Vo> cleanRecordH5Vos = tRoomCleanRecordMapper.selectTRoomCleanRecordH5List(tRoomCleanRecord);
        for (CleanRecordH5Vo vo : cleanRecordH5Vos) {
            if (vo.getEndTime() != null && vo.getStartTime() != null) {
                vo.setDuration((vo.getEndTime().getTime() - vo.getStartTime().getTime()) / 60000);
            }
            vo.setRoomStatus(OfficeEnum.RoomStatus.GetValueByCode(vo.getRoomStatus()).getInfo());
        }

        return cleanRecordH5Vos;
    }

    @Override
    public List<CleanRecordH5Vo> selectRoomAndCleanRecordByStatus(CleanRecordH5Vo tRoomCleanRecord) {

        final List<CleanRecordH5Vo> cleanRecordH5Vos = tRoomCleanRecordMapper.selectRoomAndCleanRecordByStatus(tRoomCleanRecord);
        for (CleanRecordH5Vo vo : cleanRecordH5Vos) {
            if (vo.getEndTime() != null && vo.getStartTime() != null) {
                vo.setDuration((vo.getEndTime().getTime() - vo.getStartTime().getTime()) / 60000);
            }
            vo.setRoomStatus(OfficeEnum.RoomStatus.GetValueByCode(vo.getRoomStatus()).getInfo());
        }

        return cleanRecordH5Vos;
    }

}
