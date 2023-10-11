package com.ruoyi.office.controller;

import cn.hutool.extra.qrcode.QrCodeUtil;
import cn.hutool.extra.qrcode.QrConfig;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysDictData;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.office.domain.*;
import com.ruoyi.office.domain.vo.*;
import com.ruoyi.office.service.*;
import com.ruoyi.system.service.ISysRoleService;
import com.ruoyi.system.service.ISysUserService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/office/mapi")
public class MerchantController extends BaseController {

    @Autowired
    ISysUserService userService;

    @Autowired
    private ITStoreService tStoreService;

    /**
     * 查询商家用户店铺列表
     */
    @ApiOperation("门店列表")
    @PreAuthorize("@ss.hasPermi('office:merchant')")
    @GetMapping("/store/list")
    public TableDataInfo list(TStore tStore) {
        tStore.setCreateBy(SecurityUtils.getLoginUser().getWxUser().getUserId() + "");
        startPage();
        List<TStore> list = tStoreService.selectTStoreList(tStore);
        return getDataTable(list);
    }

    @Autowired
    private ITRoomService tRoomService;
    @Autowired
    private ITRoomOrderService roomOrderService;

    /**
     * 查询店铺房间列表
     */
    @ApiOperation("房间列表")
    @PreAuthorize("@ss.hasPermi('office:merchant')")
    @GetMapping("/room/list")
    public TableDataInfo list(TRoom tRoom) {
//        if (!SecurityUtils.getUsername().equalsIgnoreCase("admin"))
        tRoom.setCreateBy(SecurityUtils.getLoginUser().getWxUser().getUserId() + "");
        startPage();
        List<TRoom> list = tRoomService.selectTRoomList(tRoom);
        List<MerchantRoomListVo> resList = new ArrayList<>();
        for (TRoom room : list) {
            MerchantRoomListVo vo = new MerchantRoomListVo();
            vo.setRoom(room);

            TRoomOrder roomOrder = new TRoomOrder();
            roomOrder.setRoomId(room.getId());
            final List<TRoomOrder> orderList = roomOrderService.selectTRoomOrderList(roomOrder).stream().sorted(Comparator.comparing(TRoomOrder::getStartTime)).collect(Collectors.toList());

            long sumHour = 0;
            BigDecimal totalAmt = new BigDecimal(0);
            boolean inExe = false;
            for (TRoomOrder order : orderList) {
                if (order.getStatus() == 5) {
                    sumHour += Math.abs((long) ((order.getEndTime().getTime() - order.getStartTime().getTime()) / (1000 * 3600)));
                    totalAmt.add(order.getPayAmount());
                }
                if (inExe) {
                    vo.setNextOrderStart(order.getStartTime());
                    break;
                }
                if (order.getStatus() == 3) {
                    vo.setOrderEndTime(order.getEndTime());
                    inExe = true;
                }
            }
            vo.setSumHour(sumHour);
            vo.setSumAmount(totalAmt);
            resList.add(vo);
        }
        return getDataTable(resList);
    }

    @Autowired
    ITWxUserService wxUserService;

    /**
     * 用户使用统计
     */
    @ApiOperation("用户使用统计-最早注册")
    @PreAuthorize("@ss.hasPermi('office:merchant')")
    @GetMapping("/user/reg")
    public TableDataInfo userReg() {
        List<MerchantUserStatisticsVo> res = wxUserService.statistics(SecurityUtils.getLoginUser().getWxUser().getUserId(), "reg");
        return getDataTable(res);
    }

    /**
     * 用户使用统计
     */
    @ApiOperation("用户使用统计-最近活跃")
    @PreAuthorize("@ss.hasPermi('office:merchant')")
    @GetMapping("/user/act")
    public TableDataInfo userAct() {
        List<MerchantUserStatisticsVo> res = wxUserService.statistics(SecurityUtils.getLoginUser().getWxUser().getUserId(), "act");
        return getDataTable(res);
    }

    /**
     * 用户使用统计
     */
    @ApiOperation("用户使用统计-订单次数")
    @PreAuthorize("@ss.hasPermi('office:merchant')")
    @GetMapping("/user/times")
    public TableDataInfo userTimes() {
        List<MerchantUserStatisticsVo> res = wxUserService.statistics(SecurityUtils.getLoginUser().getWxUser().getUserId(), "times");
        final List<MerchantUserStatisticsVo> resList = res.stream().sorted(Comparator.comparing(MerchantUserStatisticsVo::getCount).reversed()).collect(Collectors.toList());
        return getDataTable(resList);
    }

    /**
     * 用户使用统计
     */
    @ApiOperation("用户使用统计-订单总时长")
    @PreAuthorize("@ss.hasPermi('office:merchant')")
    @GetMapping("/user/hour")
    public TableDataInfo userHours() {
        List<MerchantUserStatisticsVo> res = wxUserService.statistics(SecurityUtils.getLoginUser().getWxUser().getUserId(), "hour");
        final List<MerchantUserStatisticsVo> resList = res.stream().sorted(Comparator.comparing(MerchantUserStatisticsVo::getHours).reversed()).collect(Collectors.toList());
        return getDataTable(resList);
    }

    /**
     * 用户使用统计
     */
    @ApiOperation("用户使用统计-订单总时长")
    @PreAuthorize("@ss.hasPermi('office:merchant')")
    @GetMapping("/user")
    public TableDataInfo user() {
        List<MerchantUserStatisticsVo> res = wxUserService.statistics(SecurityUtils.getLoginUser().getWxUser().getUserId(), "hour");
        final List<MerchantUserStatisticsVo> resList = res.stream().sorted(Comparator.comparing(MerchantUserStatisticsVo::getHours).reversed()).collect(Collectors.toList());
        return getDataTable(resList);
    }

    @Autowired
    ITWxUserCleanerService cleanerService;

    @ApiOperation("添加保洁")
    @PreAuthorize("@ss.hasPermi('office:merchant')")
    @Log(title = "添加保洁", businessType = BusinessType.INSERT)
    @PostMapping("/clean")
    public AjaxResult clean(@RequestBody CleanerReq req) {
        long merchant = SecurityUtils.getLoginUser().getWxUser().getId();
//        long wxUserId = 9l;
        try {
            TWxUserCleaner cleaner = new TWxUserCleaner();
            cleaner.setMerchantId(merchant);
            cleaner.setStoreId(req.getStroeId());
            cleanerService.insertTWxUserCleaner(cleaner);
            return AjaxResult.success(cleaner.getId());
        } catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }
    }

    @ApiOperation("添加保洁")
    @PreAuthorize("@ss.hasPermi('office:merchant')")
    @Log(title = "添加保洁", businessType = BusinessType.INSERT)
    @PutMapping("/clean/bind")
    public AjaxResult cleanBinding(@RequestBody TWxUserCleaner req) {
        long wxuserid = SecurityUtils.getLoginUser().getWxUser().getId();
//        long wxUserId = 9l;
        try {
            TWxUserCleaner cleaner = new TWxUserCleaner();
            cleaner.setId(req.getId());
            cleaner.setWxUserId(wxuserid);
            cleanerService.updateTWxUserCleaner(cleaner);

            TWxUser wxUser = new TWxUser();
            wxUser.setId(wxuserid);
            wxUser.setUserType("cleaner");
            wxUserService.updateTWxUser(wxUser);
            return AjaxResult.success();
        } catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }
    }

    @Autowired
    ITRoomService roomService;

    /**
     * 开门禁
     *
     * @param orderId
     * @return
     */
    @ApiOperation("开房间设备 门禁 door   电源： light,aircondition ")
    @PreAuthorize("@ss.hasPermi('office:merchant')")
    @PostMapping("/roomopen")
    public AjaxResult openRoom(@RequestBody RoomEquipeOpenReq req) {

        try {
            roomService.openRoomEquipment(req, SecurityUtils.getLoginUser().getWxUser().getUserId());
        } catch (Exception e) {
            return AjaxResult.error("操作异常，请联系管理员：" + e.getMessage());
        }

        return AjaxResult.success();
    }

    /**
     * 开门禁
     *
     * @param orderId
     * @return
     */
    @ApiOperation("关房间设备 门禁 door   电源： light,aircondition ")
    @PreAuthorize("@ss.hasPermi('office:merchant')")
    @PostMapping("/roomclose")
    public AjaxResult closeRoom(@RequestBody RoomEquipeOpenReq req) {

        try {
            roomService.closeRoomEquipment(req, SecurityUtils.getLoginUser().getWxUser().getUserId());
        } catch (Exception e) {
            return AjaxResult.error("操作异常，请联系管理员：" + e.getMessage());
        }

        return AjaxResult.success();
    }

    @Autowired
    ISysRoleService roleService;

    /**
     * h5添加员工时，员工角色列表
     */
    @ApiOperation("h5添加员工时，员工角色列表")
    @PreAuthorize("@ss.hasPermi('office:merchant')")
    @GetMapping("/role/list")
    public TableDataInfo h5Rolelist(TStore tStore) {
        List<SysRole> list = roleService.selectRoleWithNoscope();
        list = list.stream().filter(x -> "h5".equalsIgnoreCase(x.getRemark())).collect(Collectors.toList());
        return getDataTable(list);
    }


}
