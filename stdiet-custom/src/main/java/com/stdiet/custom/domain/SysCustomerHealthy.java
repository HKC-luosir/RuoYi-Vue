package com.stdiet.custom.domain;

import lombok.Data;
import com.stdiet.common.annotation.Excel;
import com.stdiet.common.core.domain.BaseEntity;

import java.util.List;

/**
 * 客户健康对象 sys_customer_healthy
 *
 * @author xzj
 * @date 2021-01-23
 */
@Data
public class SysCustomerHealthy extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 客户ID */
    //@Excel(name = "客户ID")
    private Long customerId;

    /** 加密的客户ID，非持久化字段 **/
    private String customerEncId;

    /** 客户姓名,非持久化字段 */
    @Excel(name = "客户姓名")
    private String name;

    /** 客户手机号,非持久化字段 */
    @Excel(name = "客户手机号")
    private String phone;

    /** 调理项目id */
    //@Excel(name = "调理项目id")
    private Long conditioningProjectId;

    /** 调理项目名称 ,非持久化字段*/
    @Excel(name = "调理项目")
    private String conditioningProject;

    /** 0男 1女 2未知，默认2 */
    @Excel(name = "0男 1女 2未知，默认2")
    private Long sex;

    /** 年龄 */
    @Excel(name = "年龄")
    private Long age;

    /** 身高 */
    @Excel(name = "身高")
    private Integer tall;

    /** 体重 */
    @Excel(name = "体重")
    private Long weight;

    /** 调味品种类，使用 , 隔开 */
    @Excel(name = "调味品种类，使用 , 隔开")
    private String condiment;

    /** 其他调味品种类 */
    @Excel(name = "其他调味品种类")
    private String otherCondiment;

    /** 喜好的烹调方式，使用 , 隔开 */
    @Excel(name = "喜好的烹调方式，使用 , 隔开")
    private String cookingStyle;

    /** 烹调方式对应频次，每周几次，使用 , 隔开 */
    @Excel(name = "烹调方式对应频次，每周几次，使用 , 隔开")
    private String cookingStyleRate;

    /** 洗菜方式，使用 , 隔开 */
    @Excel(name = "洗菜方式，使用 , 隔开")
    private String washVegetablesStyle;

    /** 其他洗菜方式 */
    @Excel(name = "其他洗菜方式")
    private String otherWashVegetablesStyle;

    /** 早餐习惯 */
    @Excel(name = "早餐习惯")
    private String breakfastType;

    /** 早餐吃的食物 */
    @Excel(name = "早餐吃的食物")
    private String breakfastFood;

    /** 午餐习惯，使用 , 隔开 */
    @Excel(name = "午餐习惯，使用 , 隔开")
    private String lunchType;

    /** 晚餐习惯，使用 , 隔开 */
    @Excel(name = "晚餐习惯，使用 , 隔开")
    private String dinner;

    /** 早餐当中素菜占比 */
    @Excel(name = "早餐当中素菜占比")
    private Long vegetableRate;

    /** 最常吃的肉类 */
    @Excel(name = "最常吃的肉类")
    private String commonMeat;

    /** 晚餐时间（24小时制） */
    @Excel(name = "晚餐时间", readConverterExp = "2=4小时制")
    private String dinnerTime;

    /** 每周吃夜宵次数，默认0 */
    @Excel(name = "每周吃夜宵次数，默认0")
    private Long supperNum;

    /** 夜宵通常吃的食物 */
    @Excel(name = "夜宵通常吃的食物")
    private String supperFood;

    /** 食物的冷热偏好 */
    @Excel(name = "食物的冷热偏好")
    private String dietHotAndCold;

    /** 食物的口味偏好，使用 , 隔开 */
    @Excel(name = "食物的口味偏好，使用 , 隔开")
    private String dietFlavor;

    /** 平均每周吃生菜几次 */
    @Excel(name = "平均每周吃生菜几次")
    private Long vegetablesNum;

    /** 每周吃生菜的频次类型 */
    @Excel(name = "每周吃生菜的频次类型")
    private String vegetablesRateType;

    /** 平均每天吃水果次数，默认0 */
    @Excel(name = "平均每天吃水果次数，默认0")
    private Long fruitsNum;

    /** 吃水果的时间段 */
    @Excel(name = "吃水果的时间段")
    private String fruitsTime;

    /** 平时吃水果的频次 */
    @Excel(name = "平时吃水果的频次")
    private String fruitsRate;

    /** 一餐吃几碗饭 */
    @Excel(name = "一餐吃几碗饭")
    private Long riceNum;

    /** 吃几成饱 */
    @Excel(name = "吃几成饱")
    private Long riceFull;

    /** 吃饭速度 */
    @Excel(name = "吃饭速度")
    private String eatingSpeed;

    /** 常吃的零食，使用 , 隔开 */
    @Excel(name = "常吃的零食，使用 , 隔开")
    private String snacks;

    /** 其他零食 */
    @Excel(name = "其他零食")
    private String otherSnacks;

    /** 有无服用营养保健品，0无 1有 */
    @Excel(name = "有无服用营养保健品，0无 1有")
    private Long healthProductsFlag;

    /** 营养保健品品牌名 */
    @Excel(name = "营养保健品品牌名")
    private String healthProductsBrand;

    /** 营养保健品产品名 */
    @Excel(name = "营养保健品产品名")
    private String healthProductsName;

    /** 服用营养保健品频次，每周几次 */
    @Excel(name = "服用营养保健品频次，每周几次")
    private Long healthProductsWeekRate;

    /** 服用营养保健品频次，每天几次 */
    @Excel(name = "服用营养保健品频次，每天几次")
    private Long healthProductsDayRate;

    /** 每天的饮水量，单位：毫升 */
    @Excel(name = "每天的饮水量，单位：毫升")
    private Long waterNum;

    /** 喜欢喝什么水，使用 , 隔开 */
    @Excel(name = "喜欢喝什么水，使用 , 隔开")
    private String waterType;

    /** 喝水习惯，使用 , 隔开 */
    @Excel(name = "喝水习惯，使用 , 隔开")
    private String waterHabit;

    /** 常喝的饮品的每周频次，使用，隔开 */
    @Excel(name = "常喝的饮品的每周频次，使用，隔开")
    private String drinksNum;

    /** 是否喝酒 */
    @Excel(name = "是否喝酒")
    private String drinkWineFlag;

    /** 喝酒种类，使用，隔开 */
    @Excel(name = "喝酒种类，使用，隔开")
    private String drinkWineClassify;

    /** 其他酒种类 */
    @Excel(name = "其他酒种类")
    private String otherWineClassify;

    /** 对应酒的量 */
    @Excel(name = "对应酒的量")
    private String drinkWineAmount;

    /** 是否抽烟，0否 1是，默认0 */
    @Excel(name = "是否抽烟，0否 1是，默认0")
    private Long smokeFlag;

    /** 抽烟频次和烟龄，戒烟几年，使用，隔开 */
    @Excel(name = "抽烟频次和烟龄，戒烟几年，使用，隔开")
    private String smokeRate;

    /** 是否经常抽二手烟 0否 1是，默认0 */
    @Excel(name = "是否经常抽二手烟 0否 1是，默认0")
    private Long secondSmoke;

    /** 工作行业 */
    @Excel(name = "工作行业")
    private String workIndustry;

    /** 工作性质，使用，隔开 */
    @Excel(name = "工作性质，使用，隔开")
    private String workType;

    /** 排便次数 */
    @Excel(name = "排便次数")
    private String defecationNum;

    /** 其他手动输入的排便次数 */
    @Excel(name = "其他手动输入的排便次数")
    private Long otherDefecationNum;

    /** 排便时间段，使用，隔开 */
    @Excel(name = "排便时间段，使用，隔开")
    private String defecationTime;

    /** 排便的形状 */
    @Excel(name = "排便的形状")
    private String defecationShape;

    /** 排便的气味 */
    @Excel(name = "排便的气味")
    private String defecationSmell;

    /** 排便的速度 */
    @Excel(name = "排便的速度")
    private String defecationSpeed;

    /** 排便的颜色 */
    @Excel(name = "排便的颜色")
    private String defecationColor;

    /** 每周运动次数 */
    @Excel(name = "每周运动次数")
    private Long motionNum;

    /** 每次运动的时长，分钟 */
    @Excel(name = "每次运动的时长，分钟")
    private Long motionDuration;

    /** 每天运动的时间，24小时制 */
    @Excel(name = "每天运动的时间，24小时制")
    private String motionTime;

    /** 有氧运动项目，使用，隔开 */
    @Excel(name = "有氧运动项目，使用，隔开")
    private String aerobicMotionClassify;

    /** 无氧运动项目，使用，隔开 */
    @Excel(name = "无氧运动项目，使用，隔开")
    private String anaerobicMotionClassify;

    /** 无氧有氧项目，使用，隔开 */
    @Excel(name = "无氧有氧项目，使用，隔开")
    private String anaerobicAerobicMotionClassify;

    /** 其他运动项目，使用，隔开 */
    @Excel(name = "其他运动项目，使用，隔开")
    private String otherMotionClassify;

    /** 运动场地，使用，隔开 */
    @Excel(name = "运动场地，使用，隔开")
    private String motionField;

    /** 其他运动场地 */
    @Excel(name = "其他运动场地")
    private String otherMotionField;

    /** 睡觉时间，24小时制 */
    @Excel(name = "睡觉时间，24小时制")
    private String sleepTime;

    /** 睡眠质量 */
    @Excel(name = "睡眠质量")
    private String sleepQuality;

    /** 是否有辅助入睡药物，0否 1是，默认0 */
    @Excel(name = "是否有辅助入睡药物，0否 1是，默认0")
    private Long sleepDrugFlag;

    /** 辅助睡眠类药物名称 */
    @Excel(name = "辅助睡眠类药物名称")
    private String sleepDrug;

    /** 是否经常熬夜（超过11点）0否 1是，默认0 */
    @Excel(name = "是否经常熬夜", readConverterExp = "超=过11点")
    private Long stayupLateFlag;

    /** 熬夜频次，每周几次 */
    @Excel(name = "熬夜频次，每周几次")
    private Long stayupLateWeekNum;

    /** 家族疾病史，使用，隔开 */
    @Excel(name = "家族疾病史，使用，隔开")
    private String familyIllnessHistory;

    /** 其他家族病史 */
    @Excel(name = "其他家族病史")
    private String otherFamilyIllnessHistory;

    /** 手术史，使用，隔开 */
    @Excel(name = "手术史，使用，隔开")
    private String operationHistory;

    /** 其他手术史 */
    @Excel(name = "其他手术史")
    private String otherOperationHistory;

    /** 近期是否做过手术，0否 1是，默认0 */
    @Excel(name = "近期是否做过手术，0否 1是，默认0")
    private Long nearOperationFlag;

    /** 手术恢复情况 */
    @Excel(name = "手术恢复情况")
    private String recoveryeSituation;

    /** 是否长期服用药物，0否 1是，默认0 */
    @Excel(name = "是否长期服用药物，0否 1是，默认0")
    private Long longEatDrugFlag;

    /** 长期服用的药物，使用，隔开 */
    @Excel(name = "长期服用的药物，使用，隔开")
    private String longEatDrugClassify;

    /** 其他长期服用的药物 */
    @Excel(name = "其他长期服用的药物")
    private String otherLongEatDrugClassify;

    /** 是否出现过过敏症状，0否 1是，默认0 */
    @Excel(name = "是否出现过过敏症状，0否 1是，默认0")
    private Long allergyFlag;

    /** 过敏症状 */
    @Excel(name = "过敏症状")
    private String allergySituation;

    /** 过敏源，使用，隔开 */
    @Excel(name = "过敏源，使用，隔开")
    private String allergen;

    /** 其他过敏源 */
    @Excel(name = "其他过敏源")
    private String otherAllergen;

    /** 体检报告 */
    //@Excel(name = "体检报告")
    private String medicalReport;

    /** 体检报告名称 */
    //@Excel(name = "体检报告名称")
    private String medicalReportName;

    /** 南方人北方人，0南方 1北方 */
    @Excel(name = "南方人北方人，0南方 1北方")
    private Integer position;

    /** 减脂经历方法 */
    @Excel(name = "减脂经历方法")
    private String experience;

    /** 是否减脂反弹，0否 1是 */
    @Excel(name = "是否减脂反弹，0否 1是")
    private Integer rebound;

    /** 减脂遇到的困难 */
    @Excel(name = "减脂遇到的困难")
    private String difficulty;

    /** 是否意识到生活习惯是减脂关键 0否 1是 */
    @Excel(name = "是否意识到生活习惯是减脂关键 0否 1是")
    private Integer crux;

    /** 忌口或饮食食物 */
    @Excel(name = "忌口或饮食食物")
    private String dishesIngredient;

    /** 饮食习惯 */
    @Excel(name = "饮食习惯")
    private Long makeFoodType;

    /** 客户病史体征id，使用，隔开 */
    //@Excel(name = "客户病史体征id，使用，隔开")
    private String physicalSignsId;

    /** 体征对象集合 **/
    private List<SysPhysicalSigns> signList;

    /** 其他病史体征 **/
    private String otherPhysicalSigns;

    /** 气血数据 */
    @Excel(name = "气血数据")
    private String bloodData;

    /** 湿气数据 */
    @Excel(name = "湿气数据")
    private String moistureDate;

    /** 删除标识 0未删除 1已删除。默认0 */
    private Long delFlag;
}