package com.ruoyi.system.components.prepare.spi;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;
import org.springframework.util.CollectionUtils;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.domain.entity.play.PlayMessagePushDetail;
import com.ruoyi.common.core.domain.entity.play.PlayRobotPack;
import com.ruoyi.common.core.domain.entity.play.PlayRobotPackLog;
import com.ruoyi.common.enums.PlayLogTyper;
import com.ruoyi.common.utils.Ids;
import com.ruoyi.common.utils.Objects;
import com.ruoyi.common.utils.spi.SPI;
import com.ruoyi.common.utils.spi.ServiceLoader;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.system.components.prepare.ExecutionParamContext;
import com.ruoyi.system.components.prepare.ExecutionResultContext;
import com.ruoyi.system.components.prepare.multipack.MultipackLogContainer;
import com.ruoyi.system.components.spi.Settings;
import lombok.extern.slf4j.Slf4j;

@SPI("ManualPackingTask")
@Slf4j
public class ManualPackingTask implements TaskExecution {

	@Override
	public ExecutionResultContext doExecute(ExecutionParamContext context) {
		// 发言人包装
		R<String> ret = packRobot(context);
		if (ret == null) {
			// 无需包装 , 直接同步返回
			return ExecutionResultContext.buildSync(context);
		}
		return ExecutionResultContext.buildAsync(context);
	}

	private R<String> packRobot(ExecutionParamContext context) {
		if (CollectionUtils.isEmpty(context.getPlayRobotPackList())) {
			return R.ok("设置无需包装");
		}
		final Settings tgRobotImgSettings = ServiceLoader.load(Settings.class, "TgRobotImgSettings");

		final Settings tgRobotNameSettings = ServiceLoader.load(Settings.class, "TgRobotNameSettings");

		final Settings tgGroupHashSettings = ServiceLoader.load(Settings.class, "TgGroupHashSettings");

		for (PlayRobotPack robotPck : context.getPlayRobotPackList()) {
			// 查找 对应的sort 机器人数据
			PlayMessagePushDetail detail = getBySort(context.getPushDetails(), robotPck.getMessageSort().intValue());
			if (detail == null || StringUtils.isEmpty(detail.getRobotId())) {
				log.error("数据错误 {} {}", robotPck.getMessageSort().intValue(), context.getPushDetails());
				continue;
			}
			List<String> robotList = new ArrayList<>();
			robotList.add(detail.getRobotId());
			// 备用号 也要 设置人设
			if (!StringUtils.isEmpty(detail.getSpareRobot())) {
				robotList.addAll(Arrays.asList(StringUtils.split(detail.getSpareRobot(), ",")));
			}
			// 总共提交的数据
			final List<PlayRobotPackLog> submitList = new ArrayList<>();
			// 包装 组id
			final String radioId = Ids.getId();
			// 每个机器人都要请求人设
			for (String robot : robotList) {
				// 请求 设置 机器人头像 ，昵称等
				Map<String, Object> param = new HashMap<>();
				param.put(Settings.Key_PlayId, context.getPlay().getId());
				// 机器人id
				param.put(Settings.Key_RobotId, robot);
				// 群id
				param.put(Settings.Key_GroupId, context.getChatroomId());
				// 姓名
				param.put(Settings.Key_Names1, Objects.wrapNull(robotPck.getName(), ""));
				// 姓氏
				param.put(Settings.Key_Names2, Objects.wrapNull(robotPck.getSurname(), ""));
				// 管理员
				param.put(Settings.Key_Admin_Flag,
						Objects.wrapNull(robotPck.getIsAdmin(), new Integer(0)).intValue() == 0 ? false : true);
				// 头像
				param.put(Settings.Key_Img, Objects.wrapNull(robotPck.getPic(), ""));
				// 备用号
				param.put(Settings.Key_Backup_Flag, findBackup(detail.getRobotId(), robot));

				// 设置头像
				if (!StringUtils.isEmpty(robotPck.getPic())) {
					PlayRobotPackLog ret = tgRobotImgSettings.set(param);
					if (StringUtils.isEmpty(ret.getOpt())) {
						context.log(context, PlayLogTyper.Robot_Settings, false, "[发言人包装-头像] 群("
								+ context.getChatroomId() + ") 号(" + robot + ")同步请求失败, 原因:" + ret.getErrMsg() , robot);
					} else {
						context.log(context, PlayLogTyper.Robot_Settings, false, "[发言人包装-头像] 群("
								+ context.getChatroomId() + ") 号(" + robot + ")请求成功，等待回调，操作码:" + ret.getOpt(), robot);
					}
					submitList.add(ret.wrapOpt().wrapRadio(radioId).wrapPushDetailId(detail.getId()));
				}

				// 设置 昵称
				if (!StringUtils.isEmpty(robotPck.getName()) || !StringUtils.isEmpty(robotPck.getSurname())) {
					PlayRobotPackLog ret = tgRobotNameSettings.set(param);
					if (StringUtils.isEmpty(ret.getOpt())) {
						context.log(context, PlayLogTyper.Robot_Settings, false, "[发言人包装-姓名] 群("
								+ context.getChatroomId() + ") 号(" + robot + ")同步请求失败, 原因:" + ret.getErrMsg(), robot);
					} else {
						context.log(context, PlayLogTyper.Robot_Settings, false, "[发言人包装-姓名] 群("
								+ context.getChatroomId() + ") 号(" + robot + ")请求成功，等待回调，操作码:" + ret.getOpt(), robot);
						submitList.add(ret.wrapOpt().wrapRadio(radioId).wrapPushDetailId(detail.getId()));
					}
				}

				// 设置 hash值 + 管理员
				if (robotPck.getIsAdmin() != null && robotPck.getIsAdmin().intValue() == 1) {
					PlayRobotPackLog ret = tgGroupHashSettings.set(param);
					if (StringUtils.isEmpty(ret.getOpt())) {
						context.log(context, PlayLogTyper.Robot_Settings, false, "[发言人包装-管理员（获取hash值）] 群("
								+ context.getChatroomId() + ") 号(" + robot + ")同步请求失败, 原因:" + ret.getErrMsg(), robot);
					} else {
						context.log(context, PlayLogTyper.Robot_Settings, false, "[发言人包装-管理员（获取hash值）] 群("
								+ context.getChatroomId() + ") 号(" + robot + ")请求成功，等待回调，操作码:" + ret.getOpt(), robot);
					}
					final String opt = ret.wrapOpt().getOpt();
					submitList.add(ret.wrapRadio(radioId).wrapPushDetailId(detail.getId()));

					// 插入一条 后置 请求
					PlayRobotPackLog postposition = new PlayRobotPackLog();
					postposition.setChatroomId(context.getChatroomId());
					postposition.setCreateTime(new Date());
					postposition.setIsBackup((boolean) param.get(Settings.Key_Backup_Flag) ? 1 : 0);
					postposition.setIsFinish(0);
					// 1-设置机器人姓名，姓氏 2-设置机器人头像 3-设置群hash值 4-设置管理员
					postposition.setOp(4);
					postposition.setOpt("wait_" + Ids.getId());
					postposition.setPlayId(context.getPlay().getId());
					postposition.setRadioId(radioId);
					postposition.setRetryCount(0);
					postposition.setRobotId(robot);
					postposition.setStatus(-1);
					postposition.setPushDetailId(detail.getId());
					// 等待某个操作码执行完成才能开始调佣
					postposition.setWaitOpt(opt);
					submitList.add(postposition);
				}
			}
			// 提交到 容器
			SpringUtils.getBean(MultipackLogContainer.class).submit(submitList);
		}
		return R.ok();
	}

	private boolean findBackup(String robotId, String curRobot) {
		return !robotId.equals(curRobot);
	}

	private PlayMessagePushDetail getBySort(List<PlayMessagePushDetail> datas, int sort) {
		for (PlayMessagePushDetail detail : datas) {
			if (detail.getMessageSort().intValue() == sort) {
				return detail;
			}
		}
		return null;
	}

}
