package com.ruoyi.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.PageDto;
import com.ruoyi.entity.SourceCalculationDirectCost;
import com.ruoyi.entity.SourceZeroBill;
import com.ruoyi.mapper.SourceCalculationDirectCostMapper;
import com.ruoyi.service.ISourceCalculationDirectCostService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 * <p>
 * 成本测算导入（直接费） 服务实现类
 * </p>
 *
 * @author HH
 * @since 2024-01-13
 */
@Service
public class SourceCalculationDirectCostServiceImpl extends ServiceImpl<SourceCalculationDirectCostMapper, SourceCalculationDirectCost> implements ISourceCalculationDirectCostService {

    @Override
    public void importData(MultipartFile file) {

    }

    @Override
    public void saveOrUpdateData(SourceZeroBill sourceZeroBill) {

    }

    @Override
    public Page<SourceCalculationDirectCost> dataList(PageDto pageDto) {
        return null;
    }
}
