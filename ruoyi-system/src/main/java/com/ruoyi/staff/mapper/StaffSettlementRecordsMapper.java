package com.ruoyi.staff.mapper;

import java.util.List;
import com.ruoyi.staff.domain.StaffSettlementRecords;

/**
 * 员工结算记录Mapper接口
 *
 * @author Lam
 * @date 2023-09-14
 */
public interface StaffSettlementRecordsMapper {

    /**
     * 查询员工结算记录
     *
     * @param id 员工结算记录主键
     * @return 员工结算记录
     */
    public StaffSettlementRecords selectStaffSettlementRecordsById(Long id);

    /**
     * 查询员工结算记录列表
     *
     * @param staffSettlementRecords 员工结算记录
     * @return 员工结算记录集合
     */
    public List<StaffSettlementRecords> selectStaffSettlementRecordsList(StaffSettlementRecords staffSettlementRecords);

    /**
     * 新增员工结算记录
     *
     * @param staffSettlementRecords 员工结算记录
     * @return 结果
     */
    public int insertStaffSettlementRecords(StaffSettlementRecords staffSettlementRecords);

    /**
     * 修改员工结算记录
     *
     * @param staffSettlementRecords 员工结算记录
     * @return 结果
     */
    public int updateStaffSettlementRecords(StaffSettlementRecords staffSettlementRecords);

    /**
     * 删除员工结算记录
     *
     * @param id 员工结算记录主键
     * @return 结果
     */
    public int deleteStaffSettlementRecordsById(Long id);

    /**
     * 批量删除员工结算记录
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteStaffSettlementRecordsByIds(Long[] ids);
}
