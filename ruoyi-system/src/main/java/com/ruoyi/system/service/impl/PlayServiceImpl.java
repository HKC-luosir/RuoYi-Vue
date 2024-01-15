package com.ruoyi.system.service.impl;

import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.domain.dto.play.PlayDTO;
import com.ruoyi.common.core.domain.entity.play.Play;
import com.ruoyi.system.domain.dto.play.QueryPlayDTO;
import com.ruoyi.system.domain.vo.play.PlayGroupProgressVO;
import com.ruoyi.system.domain.vo.play.PlayTaskProgressVO;
import com.ruoyi.system.domain.vo.play.QueryPlayVO;
import com.ruoyi.system.mapper.PlayMapper;
import com.ruoyi.system.service.IPlayService;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class PlayServiceImpl extends ServiceImpl<PlayMapper, Play> implements IPlayService {


    @Override
    public R<String> create(PlayDTO dto) {
        //todo 验证参数
        checkPlayParams(dto);

        String playId = IdWorker.getIdStr();
        //t_play_info

        //t_play_group_pack
        //t_play_robot_pack

        //t_play_message

        //判断混淆状态 t_play_message_confound

        return R.ok();
    }

    private void setPlay(PlayDTO dto) {
        Play play = new Play();

    }

    private boolean checkPlayParams(PlayDTO dto) {
        return true;
    }

    @Override
    public R<String> update(PlayDTO dto) {
        //判断状态，不同状态限制修改字段

        //更新基础信息表

        //删除人设包装

        //保存人设包装

        //判断混淆状态 t_play_message_confound

        return R.ok();
    }

    @Override
    public R<PlayDTO> info(String id) {
        PlayDTO playDTO = new PlayDTO();
        playDTO.setId("1");
        return R.ok(playDTO);
    }

    @Override
    public Page<QueryPlayVO> page(QueryPlayDTO dto) {
        Page<QueryPlayVO> page = new Page<>(dto.getPage(),dto.getLimit());
        baseMapper.selectPage(page, dto);
        if (CollectionUtils.isEmpty(page.getRecords())){
            return page;
        }
        List<String> ids = page.getRecords().stream()
                .map(QueryPlayVO::getId)
                .collect(Collectors.toList());
        List<PlayTaskProgressVO> taskProgressList = baseMapper.selectTaskProgress(ids);
        Map<String, PlayTaskProgressVO> map = taskProgressList.stream()
                .collect(Collectors.toMap(PlayTaskProgressVO::getPlayId, Function.identity(), (k1, k2) -> k2));
        for (QueryPlayVO record : page.getRecords()) {
            record.setPlayTaskProgressVO(map.get(record.getId()));
        }
        return page;
    }


    @Override
    public PlayTaskProgressVO taskProgress(String playId) {
        return null;
    }

    @Override
    public PlayGroupProgressVO groupProgress(String playId) {
        return null;
    }
}
