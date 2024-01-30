package com.ruoyi.common.config;

import java.util.HashMap;
import java.util.Map;

public class ErrInfoConfig {

	public static Map<Integer, String> err = new HashMap<>();

	static {
		err.put(10000, "未知异常，Err: %s");
		err.put(11000, "参数异常， 字段: %s");
		err.put(11001, "商品参数异常");
		err.put(11002, "商品未上架");
		err.put(11003, "SKU列表为空");
		err.put(11004, "SKU价格为空，SKU-ID: %s");
		err.put(11005, "用户信息为空");
		err.put(11006, "订单不存在或状态已完成");
		err.put(11007, "此规格服务不存在或已下架");
		err.put(11008, "服务不存在或已下架");
		err.put(11009, "规格设置不能为空");
		err.put(11010, "导入手机号为空");
		err.put(11011, "当前账号无权限");
		err.put(11012, "已存在此服务名");
		err.put(11013, "手机号码所属国家与商品不一致");
		err.put(11014, "目标数超过购买数量");
		err.put(11015, "群数大于目标数");
		err.put(11016, "剧本内容不能为空");
		err.put(11017, "发言人昵称不能为空");
		err.put(11018, "消息类型不能为空");
		err.put(11019, "有接粉号消息类型时，接粉号池不能为空");
		err.put(11020, "自定义类型未输入信息");
		err.put(11021, "发送机制不能为空");
		err.put(11022, "多条内容间隔不能为空");
		err.put(11023, "多条内容间隔最小值必须小于最大值");
		err.put(11024, "演员之间发送间隔不能为空");
		err.put(11025, "演员之间发送间隔最小值必须小于最大值");
	}

	public static String get(int code) {
		return err.get(code);
	}

	public static String getDynmic(int code, String... param) {
		String val = err.get(code);
		return String.format(val, param);
	}

}
