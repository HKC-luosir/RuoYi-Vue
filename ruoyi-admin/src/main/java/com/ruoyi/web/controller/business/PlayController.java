package com.ruoyi.web.controller.business;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.domain.entity.MerchantInfo;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.system.domain.dto.ConfoundRetryDTO;
import com.ruoyi.system.domain.dto.QueryConfoundLogDTO;
import com.ruoyi.common.core.domain.dto.play.PlayDTO;
import com.ruoyi.system.domain.dto.play.QueryPlayDTO;
import com.ruoyi.system.domain.mongdb.PlayExecutionLog;
import com.ruoyi.system.domain.vo.QueryConfoundLogVO;
import com.ruoyi.system.domain.vo.play.PlayGroupProgressVO;
import com.ruoyi.system.domain.vo.play.PlayTaskProgressVO;
import com.ruoyi.system.domain.vo.play.QueryPlayVO;
import com.ruoyi.system.service.IPlayService;
import com.ruoyi.system.service.PlayExecutionLogService;
import com.ruoyi.system.service.PlayMessageConfoundLogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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

    @ApiOperation("创建炒群任务")
    @PostMapping(value = "/create")
    public R<String> create(@RequestBody PlayDTO dto) {
       dto.setMerchantId(getMerchantId());
        return playService.create(dto);
    }

    @ApiOperation("修改炒群任务")
    @PostMapping(value = "/update")
    public R<String> update(@RequestBody PlayDTO dto) {
        return playService.update(dto);
    }

    @ApiOperation("获取炒群任务详情")
    @GetMapping(value = "/{id}")
    public R<PlayDTO> info(@PathVariable String id) {
        return playService.info(id);
    }


    @ApiOperation("炒群任务列表")
    @PostMapping("page")
    public R<Page<QueryPlayVO>> page(@RequestBody QueryPlayDTO dto) {
        LoginUser loginUser = getLoginUser();
        MerchantInfo merchantInfo = loginUser.getMerchantInfo();
        return R.ok(playService.page(dto));
    }

    @ApiOperation("任务进度")
    @PostMapping("taskProgress/{playId}")
    public R<PlayTaskProgressVO> taskProgress(@PathVariable String playId) {
        return R.ok(playService.taskProgress(playId));
    }


    @ApiOperation("炒群进度")
    @PostMapping("groupProgress/{playId}")
    public R<PlayGroupProgressVO> groupProgress(@PathVariable String playId) {
        return R.ok(playService.groupProgress(playId));
    }

    @ApiOperation("剧本执行日志")
    @PostMapping("executionLogList/{playId}")
    public R<List<PlayExecutionLog>> executionLogList(@PathVariable String playId) {
        return R.ok(playExecutionLogService.listByPlayId(playId));
    }

    @ApiOperation("任务明细查询")
    @PostMapping("taskDetailPage")
    public R<Page<PlayExecutionLog>> taskDetailPage(@RequestBody QueryConfoundLogDTO dto) {

        return R.ok();
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
