package com.ruoyi.web.controller.business;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.annotation.RepeatSubmit;
import com.ruoyi.common.config.ErrInfoConfig;
import com.ruoyi.common.constant.HttpStatus;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.domain.dto.play.AdMonitor;
import com.ruoyi.common.core.domain.dto.play.PlayDTO;
import com.ruoyi.common.core.domain.entity.MerchantInfo;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.dto.ConfoundRetryDTO;
import com.ruoyi.system.domain.dto.QueryConfoundLogDTO;
import com.ruoyi.system.domain.dto.play.QueryPlayDTO;
import com.ruoyi.system.domain.dto.play.QueryPushDetailDTO;
import com.ruoyi.system.domain.dto.play.SetSpeedDTO;
import com.ruoyi.system.domain.mongdb.PlayExecutionLog;
import com.ruoyi.system.domain.vo.QueryConfoundLogVO;
import com.ruoyi.system.domain.vo.play.*;
import com.ruoyi.system.service.IPlayService;
import com.ruoyi.system.service.PlayExecutionLogService;
import com.ruoyi.system.service.PlayMessageConfoundLogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author : zengyi
 */
@Api(tags = "炒群任务")
@RestController
@RequestMapping("/play")
public class PlayController extends BaseController {
    @Resource
    private IPlayService playService;

    @Resource
    private PlayExecutionLogService playExecutionLogService;

    @Resource
    private PlayMessageConfoundLogService playMessageConfoundLogService;

    @RepeatSubmit(interval = 1000, message = "请求过于频繁")
    @ApiOperation("创建炒群任务")
    @PostMapping(value = "/create")
    public R<String> create(@RequestBody PlayDTO dto) {
        dto.setMerchantId(getMerchantId());
        R<String> checkPlayParamsRet = checkAddPlayParams(dto);
        if (checkPlayParamsRet.getCode() != HttpStatus.SUCCESS) {
            return checkPlayParamsRet;
        }
        return playService.create(dto);
    }

    private R<String> checkAddPlayParams(PlayDTO dto) {
        if (StringUtils.isEmpty(dto.getName())) {
            return R.fail(ErrInfoConfig.getDynmic(11000, "任务名称不能为空"));
        }
        if (dto.getName().length() > 100) {
            return R.fail(ErrInfoConfig.getDynmic(11000, "任务名称不能超过100字"));
        }
        if (null == dto.getGroupSource()) {
            return R.fail(ErrInfoConfig.getDynmic(11000, "请选择群来源"));
        }
        if (dto.getGroupSource() == 0 && dto.getGroupNum() == null) {
            return R.fail(ErrInfoConfig.getDynmic(11000, "请配置群需求数量"));
        }
        if (dto.getGroupSource() == 1 && dto.getGroupUrls().isEmpty()) {
            return R.fail(ErrInfoConfig.getDynmic(11000, "外部群链接不能为空"));
        }
        if (null == dto.getRobotNum()) {
            return R.fail(ErrInfoConfig.getDynmic(11000, "请配置每个群演员数"));
        }
        if (dto.getUrlPool().isEmpty()) {
            return R.fail(ErrInfoConfig.getDynmic(11000, "请配置接粉号池"));
        }
        return R.ok();
    }

    @RepeatSubmit(interval = 1000, message = "请求过于频繁")
    @ApiOperation("修改炒群任务")
    @PostMapping(value = "/update")
    public R<String> update(@RequestBody PlayDTO dto) {
        if (StringUtils.isEmpty(dto.getName())) {
            return R.fail(ErrInfoConfig.getDynmic(11000, "任务名称不能为空"));
        }
        if (dto.getName().length() > 100) {
            return R.fail(ErrInfoConfig.getDynmic(11000, "任务名称不能超过100字"));
        }
        return playService.updatePlay(dto);
    }

    @ApiOperation("获取炒群任务详情")
    @GetMapping(value = "/{playId}")
    public R<PlayVO> info(@PathVariable String playId) {
        return playService.info(playId);
    }

    @ApiOperation("获取广告监控配置")
    @GetMapping(value = "/{playId}/ad")
    public R<AdMonitor> adInfo(@PathVariable String playId) {
        return R.ok(playService.adInfo(playId));
    }

    @ApiOperation("修改广告监控配置")
    @PostMapping(value = "/{playId}/ad")
    public R<String> updateAdInfo(@PathVariable String playId, @RequestBody AdMonitor dto) {
        return playService.updateAdInfo(playId, dto);
    }

    @ApiOperation("设置炒群速度")
    @PostMapping("setSpeed")
    public R<Void> setSpeed(@Validated @RequestBody SetSpeedDTO dto) {
        playService.setSpeed(dto);
        return R.ok();
    }

    @ApiOperation("炒群任务列表")
    @PostMapping("page")
    public R<Page<QueryPlayVO>> page(@RequestBody QueryPlayDTO dto) {
        MerchantInfo merchantInfo = getMerchantInfo();
        if (merchantInfo != null) {
            if (!merchantInfo.getMerchantType().equals(2)) {
                dto.setMerchantId(merchantInfo.getMerchantId());
            }
        }
        return R.ok(playService.page(dto));
    }

    @ApiOperation("任务进度")
    @PostMapping("taskProgress/{playId}")
    public R<PlayTaskProgressVO> taskProgress(@PathVariable String playId) {
        return R.ok(playService.taskProgress(playId));
    }

    @ApiOperation("炒群进度")
    @PostMapping("groupProgress/{playId}")
    public R<List<PlayGroupProgressVO>> groupProgress(@PathVariable String playId) {
        return R.ok(playService.groupProgress(playId));
    }

    @ApiOperation("剧本执行日志")
    @PostMapping("executionLogList/{playId}")
    public R<List<PlayExecutionLog>> executionLogList(@PathVariable String playId) {
        return R.ok(playExecutionLogService.listByPlayId(playId));
    }

    @ApiOperation("任务推送明细查询")
    @PostMapping("pushDetailPage")
    public R<Page<QueryPushDetailVO>> pushDetailPage(@Validated @RequestBody QueryPushDetailDTO dto) {
        return R.ok(playService.pushDetailPage(dto));
    }


    @ApiOperation("混淆日志查询")
    @PostMapping("confoundLogPage")
    public R<Page<QueryConfoundLogVO>> confoundLogPage(@RequestBody QueryConfoundLogDTO dto) {
        return R.ok(playMessageConfoundLogService.page(dto));
    }

    @ApiOperation("混淆重试")
    @PostMapping("confoundRetry")
    public R<Void> confoundRetry(@RequestBody ConfoundRetryDTO dto) {
        playMessageConfoundLogService.retry(dto);
        return R.ok();
    }

    @ApiOperation("账号明细")
    @PostMapping("robotDetailPage")
    public R<Void> robotDetailPage() {

        return R.ok();
    }


}
