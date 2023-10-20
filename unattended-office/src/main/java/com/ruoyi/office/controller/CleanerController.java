package com.ruoyi.office.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.office.domain.TRoom;
import com.ruoyi.office.domain.TRoomCleanRecord;
import com.ruoyi.office.domain.TStore;
import com.ruoyi.office.domain.TStoreUser;
import com.ruoyi.office.domain.enums.OfficeEnum;
import com.ruoyi.office.domain.vo.CleanRecordH5Vo;
import com.ruoyi.office.domain.vo.CleanerRoomOpenReq;
import com.ruoyi.office.domain.vo.RoomEquipeOpenReq;
import com.ruoyi.office.service.ITRoomCleanRecordService;
import com.ruoyi.office.service.ITRoomService;
import com.ruoyi.office.service.ITStoreService;
import com.ruoyi.office.service.ITStoreUserService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.ruoyi.common.utils.PageUtils.startPage;

@RestController
@RequestMapping("/office/capi")
public class CleanerController extends BaseController {

    @Autowired
    ITRoomService roomService;

    @Autowired
    ITRoomCleanRecordService cleanRecordService;

    @Autowired
    ITStoreUserService storeUserService;

    @Autowired
    ITStoreService storeService;


    /**
     * 保洁开包厢
     *
     * @param req
     * @return
     */
    @ApiOperation("保洁开包厢")
    @PreAuthorize("@ss.hasRole('cleaner') || @ss.hasStoreRole(#req.storeId, 'cleaner')")
    @PostMapping("/roomopen")
    public AjaxResult openRoom(@RequestBody CleanerRoomOpenReq req) {

        Long userId = SecurityUtils.getLoginUser().getWxUser().getId();
        try {
            roomService.openCleanerRoomEquipment(req, userId);

            TRoomCleanRecord cleanRecord = new TRoomCleanRecord();
            cleanRecord.setCreateBy(userId + "");
            cleanRecord.setWxUserId(userId);
            cleanRecord.setRoomId(req.getRoomId());
            cleanRecord.setStartTime(new Date());
            cleanRecord.setStatus(OfficeEnum.CleanRecordStatus.CLEANING.getCode());
            cleanRecordService.insertTRoomCleanRecord(cleanRecord);

          /*  TRoom room = new TRoom();
            room.setId(req.getRoomId());
            // 2 清洁中
            room.setStatus(OfficeEnum.RoomStatus.IN_CLEAN.getCode());
            roomService.updateTRoom(room);*/

        } catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }

        return AjaxResult.success();
    }

    /**
     * 保洁临时开包厢
     *
     * @param req
     * @return
     */
    @ApiOperation("保洁临时开包厢")
//      @PreAuthorize("@ss.hasRole('cleaner') || @ss.hasStoreRole(#req.storeId, 'ad')")
    @PostMapping("/roomopen/temp")
    public AjaxResult openRoomTemporary(@RequestBody CleanerRoomOpenReq req) {

        Long userId = SecurityUtils.getLoginUser().getWxUser().getUserId();
        try {
            TRoom room = roomService.selectTRoomById(req.getRoomId());
            if (!OfficeEnum.RoomStatus.IN_CLEAN.getCode().equalsIgnoreCase(room.getStatus())) {
                throw new ServiceException("清洁中的房间才可以开门");
            }
            roomService.openCleanerRoomEquipment(req, userId);
        } catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }

        return AjaxResult.success();
    }

    /**
     * 保洁关包厢
     *
     * @param req
     * @return
     */
    @ApiOperation("保洁关包厢")
//      @PreAuthorize("@ss.hasRole('cleaner') || @ss.hasStoreRole(#req.storeId, 'ad')")
    @PostMapping("/roomclose")
    public AjaxResult roomclose(@RequestBody CleanerRoomOpenReq req) {

        Long userId = SecurityUtils.getLoginUser().getWxUser().getUserId();
        try {
            TRoomCleanRecord exRecord = roomCleanRecordService.selectTRoomCleanRecordById(req.getRecordId());
            if (exRecord == null) {
                throw new ServiceException("未找到制定打扫记录");
            }
            roomService.closeCleanerRoomEquipment(req, userId); // 测试关闭 ，上线打开

            TRoomCleanRecord cleanRecord = new TRoomCleanRecord();
            cleanRecord.setId(req.getRecordId());
            cleanRecord.setEndTime(new Date());
            cleanRecord.setStatus(OfficeEnum.CleanRecordStatus.COMPLETE.getCode());
            cleanRecord.setUpdateBy(userId + "");
            cleanRecord.setUpdateTime(new Date());
            cleanRecordService.updateTRoomCleanRecord(cleanRecord);

            TRoom room = new TRoom();
            room.setId(req.getRoomId());
            room.setStatus(OfficeEnum.RoomStatus.CAN_USE.getCode());
            roomService.updateTRoom(room);

        } catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }

        return AjaxResult.success();
    }

    /**
     * 保洁临时关包厢
     *
     * @param req
     * @return
     */
    @ApiOperation("保洁临时关包厢")
//      @PreAuthorize("@ss.hasRole('cleaner') || @ss.hasStoreRole(#req.storeId, 'ad')")
    @PostMapping("/roomclose/temp")
    public AjaxResult roomcloseTemporary(@RequestBody CleanerRoomOpenReq req) {

        Long userId = SecurityUtils.getLoginUser().getWxUser().getUserId();
        try {
            roomService.closeCleanerRoomEquipment(req, userId);
        } catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }

        return AjaxResult.success();
    }

    /**
     * 保洁开大门
     *
     * @param req
     * @return
     */
    @ApiOperation("保洁开大门")
    @PreAuthorize("@ss.hasRole('cleaner') || @ss.hasStoreRole(#req.storeId, 'cleaner')")
    @PostMapping("/storeopen")
    public AjaxResult openStore(@RequestBody CleanerRoomOpenReq req) {

        Long userId = SecurityUtils.getLoginUser().getUserId();
        try {
            roomService.openCleanerStore(req, userId);
        } catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }

        return AjaxResult.success();
    }

    @Autowired
    ITRoomCleanRecordService roomCleanRecordService;

    /**
     * 查询保洁员自己房间打扫记录列表
     */
    //@PreAuthorize("@ss.hasRole('cleaner')")
    @GetMapping("/record")
    public TableDataInfo h5list(CleanRecordH5Vo tRoomCleanRecord) {
        Long userId = SecurityUtils.getLoginUser().getWxUser().getId();
        tRoomCleanRecord.setWxUserId(userId);
        startPage();
        List<CleanRecordH5Vo> list = roomCleanRecordService.selectTRoomCleanRecordH5List(tRoomCleanRecord);

        return getDataTable(list);
    }

    @Autowired
    private ITRoomService tRoomService;


    /**
     * 查询店铺房间列表
     */
    @ApiOperation("房间列表")
    //@PreAuthorize("@ss.hasRole('cleaner')")
    @GetMapping("/room/list")
    public TableDataInfo list(CleanRecordH5Vo qry) {

//        qry.setStatus(OfficeEnum.CleanRecordStatus.CLEANING.getCode());
        startPage();
        List<CleanRecordH5Vo> list = roomCleanRecordService.selectRoomAndCleanRecordByStatus(qry);

        return getDataTable(list);
    }

    @GetMapping("/store/list")
    public AjaxResult storeList(){
        TStoreUser query = new TStoreUser();
        query.setUserId(getLoginUser().getWxUser().getId());
        List<TStoreUser> storeUsers = storeUserService.selectTStoreUserList(query);
        List<TStore> storeList = new ArrayList<>();
        for (TStoreUser storeUser: storeUsers){
            storeList.add(storeService.selectTStoreById(storeUser.getStoreId()));
        }
        return success(storeList);
    }
}
