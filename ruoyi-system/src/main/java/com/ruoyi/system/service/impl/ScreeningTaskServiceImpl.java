package com.ruoyi.system.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.domain.entity.ProductSku;
import com.ruoyi.system.domain.ScreeningTask;
import com.ruoyi.system.domain.dto.*;
import com.ruoyi.system.domain.vo.*;
import com.ruoyi.system.mapper.ScreeningTaskMapper;
import com.ruoyi.system.service.ScreeningTaskService;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 筛查任务表(ScreeningTask)表服务实现类
 *
 * @author 朱少波
 * @since 2024-01-25 10:37:23
 */
@Service("screeningTaskService")
public class ScreeningTaskServiceImpl extends ServiceImpl<ScreeningTaskMapper, ScreeningTask> implements ScreeningTaskService {

    @Override
    public boolean checkName(String name, String merchantId) {
        return baseMapper.selectCount(new LambdaQueryWrapper<ScreeningTask>().eq(ScreeningTask::getTaskName, name)
                .eq(ScreeningTask::getMerchantId, merchantId)) > 0;
    }

    @Override
    public ScreeningTask save(String merchantId, Long userId, String taskName, String countryCode, Long productId, ProductSku productSku) {
        ScreeningTask task = new ScreeningTask();
        task.setTaskId(IdWorker.getIdStr());
        task.setTaskName(taskName);
        task.setTaskState(0);
        task.setBatchCount(1);
        task.setCreateTime(LocalDateTime.now());
        task.setUpdateTime(LocalDateTime.now());
        task.setCompletionTime(null);
        task.setMerchantId(merchantId);
        task.setUserId(userId);
        task.setProductId(productId);
        task.setPrice(productSku.getPrice());
        task.setCountryCode(countryCode);
        baseMapper.insert(task);
        return task;
    }

    @Override
    public Page<ScreeningTaskVO> taskPage(String merchantId, ScreeningTaskPageDTO dto) {
        return baseMapper.taskPage(new Page<ScreeningTaskVO>(dto.getPage(), dto.getLimit()), merchantId, dto);
    }

    @Override
    public TaskProgressVO taskProgress(String taskId) {
        return baseMapper.taskProgress(taskId);
    }

    @Override
    public TaskBatchProgressVO batchProgress(String taskId) {
        TaskBatchProgressVO vo = new TaskBatchProgressVO();
        List<ScreeningBatchProgressVO> total = baseMapper.batchProgress(taskId);
        if (CollUtil.isNotEmpty(total)) {
            vo.setTotalList(total);
            vo.setWaitList(total.stream().filter(p -> ObjectUtil.equal(p.getBatchState(), 0)).collect(Collectors.toList()));
            vo.setScreeningList(total.stream().filter(p -> ObjectUtil.equal(p.getBatchState(), 1)).collect(Collectors.toList()));
            vo.setStopList(total.stream().filter(p -> ObjectUtil.equal(p.getBatchState(), 2)).collect(Collectors.toList()));
            vo.setCompleteList(total.stream().filter(p -> ObjectUtil.equal(p.getBatchState(), 4)).collect(Collectors.toList()));
            vo.setCancelList(total.stream().filter(p -> ObjectUtil.equal(p.getBatchState(), 3)).collect(Collectors.toList()));
        }
        return vo;
    }

    @Override
    public List<ScreeningTaskResultVO> taskResult(ScreeningTaskExportDTO dto) {
        return baseMapper.taskResult(dto);
    }

    @Override
    public void addTarget(ScreeningTask task) {
        task.setBatchCount(task.getBatchCount() + 1);

        ScreeningTask update = new ScreeningTask();
        update.setTaskId(task.getTaskId());
        update.setUpdateTime(LocalDateTime.now());
        update.setBatchCount(task.getBatchCount());
        baseMapper.updateById(update);
    }

    @Override
    public Page<ScreeningTaskDetailVO> taskDetail(ScreeningTaskDetailDTO dto) {
        Page page = new Page<>(dto.getPage(), dto.getLimit());
        if (dto instanceof ScreeningTaskDetailExportDTO) {
            page.setSearchCount(false);
        }
        return baseMapper.page(page, dto);
    }


}
