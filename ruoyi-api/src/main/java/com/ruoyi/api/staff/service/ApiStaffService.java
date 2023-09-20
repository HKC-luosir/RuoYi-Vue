package com.ruoyi.api.staff.service;

import com.ruoyi.api.staff.model.vo.ApiStaffLevelConfigVo;
import com.ruoyi.common.constant.RedisKeyConstants;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.staff.domain.StaffLevelConfig;
import com.ruoyi.staff.mapper.StaffLevelConfigMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author LAM
 * @date 2023/9/20 16:05
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ApiStaffService {

    private final StaffLevelConfigMapper staffLevelConfigMapper;
    private final RedisCache redisCache;

    /**
     * 获取员工等级配置
     *
     * @return 结果
     * */
    public List<ApiStaffLevelConfigVo> selectStaffLevelConfig() {
        log.info("获取员工等级配置：开始");
        List<ApiStaffLevelConfigVo> voList = new ArrayList<>();
        String key = RedisKeyConstants.STAFF_LEVEL_CONFIG_DATA;
        if (redisCache.hasKey(key)){
            voList = redisCache.getCacheList(key);
            log.info("获取员工等级配置：完成，存在缓存，直接返回：{}", voList);
            return voList;
        }
        // 查询数据库
        List<StaffLevelConfig> staffLevelConfigs = staffLevelConfigMapper.selectStaffLevelConfigList(new StaffLevelConfig());
        for (StaffLevelConfig item : staffLevelConfigs){
            ApiStaffLevelConfigVo vo = new ApiStaffLevelConfigVo();
            BeanUtils.copyBeanProp(vo, item);
            voList.add(vo);
        }
        log.info("获取员工等级配置：完成，返回数据：{}", voList);
        return voList;
    }
}
