package com.ruoyi.web.controller.sendEmail;

import invest.lixinger.index.fundamental.CN.VO.indexFundamentalCNResult_RootVO;
import invest.lixinger.index.fundamental.CN.getParam_indexFundamentalCN;
import invest.lixinger.index.fundamental.CN.getResult_indexFundamentalCN;
import invest.lixinger.index.fundamental.CN.request_indexFundamentalCN;
import invest.lixinger.index.fundamental.HK.HSI.VO.indexFundamentalHSIResult_DataVO;
import invest.lixinger.index.fundamental.HK.HSI.VO.indexFundamentalHSIResult_RootVO;
import invest.lixinger.index.fundamental.HK.HSI.getParam_indexFundamentalHSI;
import invest.lixinger.index.fundamental.HK.HSI.getResult_indexFundamentalHSI;
import invest.lixinger.index.fundamental.HK.HSI.request_indexFundamentalHSI;
import invest.lixinger.index.fundamental.US.spx.VO.indexFundamentalSPXResult_DataVO;
import invest.lixinger.index.fundamental.US.spx.VO.indexFundamentalSPXResult_RootVO;
import invest.lixinger.index.fundamental.US.spx.getParam_indexFundamentalSPX;
import invest.lixinger.index.fundamental.US.spx.getResult_indexFundamentalSPX;
import invest.lixinger.index.fundamental.US.spx.request_indexFundamentalSPX;
import invest.lixinger.macro.moneySupply.VO.moneySupplyCNParam_DataVO;
import invest.lixinger.macro.moneySupply.VO.moneySupplyCNResult_RootVO;
import invest.lixinger.macro.moneySupply.getParam_moneySupplyCN;
import invest.lixinger.macro.moneySupply.getResult_moneySupplyCN;
import invest.lixinger.macro.moneySupply.request_moneySupplyCN;
import invest.lixinger.macro.nationalDebt.VO.nationalDebtResult_DataVO;
import invest.lixinger.macro.nationalDebt.VO.nationalDebtResult_RootVO;
import invest.lixinger.macro.nationalDebt.getParam_nationDebtCN;
import invest.lixinger.macro.nationalDebt.getParam_nationDebtUS;
import invest.lixinger.macro.nationalDebt.getResult_nationDebtUS;
import invest.lixinger.macro.nationalDebt.request_nationDebt;
import invest.lixinger.macro.priceIndex.china.VO.PriceIndexCNResult_DataVO;
import invest.lixinger.macro.priceIndex.china.VO.PriceIndexCNResult_RootVO;
import invest.lixinger.macro.priceIndex.china.getParam_PriceIndexCN;
import invest.lixinger.macro.priceIndex.china.getResult_PriceIndexCN;
import invest.lixinger.macro.priceIndex.china.request_PriceIndexCN;
import invest.lixinger.utils.netRequest;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.yaml.snakeyaml.Yaml;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.*;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import static invest.lixinger.index.fundamental.CN.request_indexFundamentalCN.calculateFundamentalCN;
import static invest.lixinger.index.fundamental.HK.HSI.request_indexFundamentalHSI.*;
import static invest.lixinger.index.fundamental.US.spx.request_indexFundamentalSPX.*;
import static invest.lixinger.macro.nationalDebt.request_nationDebt.calcultePos;
import static invest.lixinger.macro.nationalDebt.request_nationDebt.calcultePos;

// https://www.cnblogs.com/ooo0/p/16446829.html
@Component
@MapperScan
public class sendEmailUtils {

    /**
     * JavaMailSender是Spring Boot在MailSenderPropertiesConfiguration类中配置好的，
     * 该类在Mail自动配置类MailSenderAutoConfiguration中导入，因此这里注入JavaMailSender就可以使用了。
     */
    @Autowired
    JavaMailSender javaMailSender;

    /**
     * 产生文本
     */
    public static Map<String, String> getText() throws IOException, ParseException {
        Map<String, String> map = new HashMap<>();
        try {
            String Text = "▶现阶段：\n";
            String subject = null;
            // 基本面判断----------------------
            try {
                Map<String, String> fundamentalMap = getTextFundamentalCN();
                double resultFundamental = Double.parseDouble(fundamentalMap.get("resultFundamental"));
                double result100 = resultFundamental * 100;
                String Textzhaiquan = "  ◆将资产投资债券、货币基金，利率高则买债券、黄金，利率低则买货币基金\n\n";
                String Textgupiao = "  ◆基金备选池：科创信息、科创创业50、科创50、创业板全指、全指信息、TMT、中创400、中证500、中证军工、国证2000、全指医疗、中小企业300、中概互联网\n";
                Textgupiao += "  ◆股票备选池：证券 > 银行\n\n";

                if (result100 > 45) {
                    Text += Textzhaiquan;
                } else if (35 < result100 && result100 < 45) {
                    Text += Textzhaiquan;
                } else if (25 < result100 && result100 < 35) {
                    Text += "  ◆定投总资金 通过 197 个周定投，其中定投总资金 = 总资金 - 已投入\n";
                    Text += "  ◆股票基金以大公司、主动型基金为主\n\n";
                } else if (15 < result100 && result100 < 25) {
                    Text += "  ◆定投总资金 通过 96 个周定投，其中定投总资金 = 总资金 - 已投入\n";
                    Text += "  ◆股票基金以中型公司、主动型基金为主\n\n";
                } else if (10 < result100 && result100 < 15) {
                    Text += "  ◆定投总资金 通过 18 个周定投，其中定投总资金 = 总资金 - 已投入\n";
                    Text += Textgupiao;
                } else if (5 < result100 && result100 < 10) {
                    Text += "  ◆梭哈梭哈梭哈梭哈梭哈梭哈梭哈梭哈梭哈梭哈梭哈梭哈梭哈\n";
                    Text += "  ◆现在离最低点可能还有10~20%的幅度，但为不错过机会，我将永远相信历史会简单的重复\n\n";
                    Text += Textgupiao;
                }
                String resultFormat = new DecimalFormat("0.00%").format(resultFundamental);
                subject = fundamentalMap.get("fundamentalDate") + "，当日信号为" + resultFormat;
            } catch (Exception e) {
                System.out.println(e.getMessage() + "基本面判断 出错");
            }

            // ----------------国债----------------------------------
            Map<String, String> cnDebtMap = null;
            try {
                cnDebtMap = getTextCNDebt();
                Text += "▶国债最新数据日期为：" + cnDebtMap.get("date") + "\n";
                Text += "  ◆最近十年：2、3、5、10年期的平均信号为：" + new DecimalFormat("0.00%").format(Double.valueOf(cnDebtMap.get("averagePos"))) + "\n";
                if (cnDebtMap.containsKey("latestDayDebtCNInverted")) {
                    Text += "  ◆最近日期国债倒挂比例：" + cnDebtMap.get("latestDayDebtCNInverted") + "，一个月前国债倒挂比例：" + cnDebtMap.get("oneMonthAgoDebtCNInverted") + "\n\n";
                } else {
                    Text += "  ◆最近日期、一个月前，国债没有倒挂\n\n";
                }
            } catch (Exception e) {
                System.out.println(e.getMessage() + "国债 出错");
            }

            // --------------------美债-------------------------------
            Map<String, String> usDebtMap;
            try {
                usDebtMap = getTextUSDebt();
                Text += "▶美债最新数据日期为：" + usDebtMap.get("date") + "\n";
                Text += "  ◆最近十年：2、3、5、10年期的平均信号为：" + new DecimalFormat("0.00%").format(Double.valueOf(usDebtMap.get("averagePos"))) + "\n";
                if (usDebtMap.containsKey("latestDayDebtUSInverted")) {
                    Text += "  ◆美债倒挂比例为：" + usDebtMap.get("latestDayDebtUSInverted") + "。一个月前美债倒挂比例为：" + usDebtMap.get("oneMonthAgoDebtUSInverted") + "\n\n";
                } else {
                    Text += "  ◆最近日期、一个月前，美债没有倒挂\n\n";
                }
            } catch (Exception e) {
                System.out.println(e.getMessage() + "美债 出错");
            }

            // ----------------SPX信号值----------------
            Map<String, Object> mapSPX;
            double posSPX = 0;
            try {
                mapSPX = getTextSPX();
                posSPX = (double) mapSPX.get("posSPX");
                String dateSPX = (String) mapSPX.get("dateSPX");
                Text += "▶美股最新数据日期为：" + dateSPX + "\n";
                Text += "  ◆信号为：" + new DecimalFormat("0.00%").format(posSPX) + "\n";
                if (posSPX < 0.3) {
                    Text += "  ◆结论：可考虑美股现在出现的机会\n\n";
                } else {
                    Text += "  ◆结论：美股暂无机会\n\n";
                }
            } catch (Exception e) {
                System.out.println(e.getMessage() + "SPX信号值 出错");
            }

            // ----------------HSI信号值----------------
            try {
                Map<String, Object> mapHSI = getTextHSI();
                double posHSI = (double) mapHSI.get("posHSI");
                String dateHSI = (String) mapHSI.get("dateHSI");
                Text += "▶港股最新数据日期为：" + dateHSI + "\n";
                Text += "  ◆信号为：" + new DecimalFormat("0.00%").format(posHSI) + "\n";
                if (posSPX < 0.3) {
                    Text += "  ◆结论：可考虑港股现在出现的机会\n\n";
                } else {
                    Text += "  ◆结论：港股暂无机会\n\n";
                }
            } catch (Exception e) {
                System.out.println(e.getMessage() + "HSI信号值 出错");
            }

            // ----------------中国cpi----------------
            Map<String, Object> mapCNCPI = null;
            try {
                mapCNCPI = getTextCNPriceIndex();
                String CNCPI0 = (String) mapCNCPI.get("CNCPI0");
                String CNCPI1 = (String) mapCNCPI.get("CNCPI1");
                String CNCPI2 = (String) mapCNCPI.get("CNCPI2");
                String CNCPI3 = (String) mapCNCPI.get("CNCPI3");
                String CNCPIDate = (String) mapCNCPI.get("CNCPIDate");
                Text += "▶中国cpi最新数据日期为：" + CNCPIDate + "\n";
                Text += "  ◆连续4个月的cpi为：" + CNCPI3 + "、" + CNCPI2 + "、" + CNCPI1 + "、" + CNCPI0 + "\n";
                Text += "  ◆近10年，cpi信号为：" + mapCNCPI.get("CPIPos") + "\n\n";
            } catch (Exception e) {
                System.out.println(e.getMessage() + "中国cpi 出错");
            }

            // ------------cpi和国债共同计算百分位，由于cpi不太稳定，所以给予的权重较少-------
            try {
                double CNDebtWeight = 0.8;
                double CPIWeight = 0.2;
                Map<String, Object> mapCPIandCNDebtPOS = calculateCPIandCNDebt(cnDebtMap, mapCNCPI, CNDebtWeight, CPIWeight);
                String CPIandCNDebtPos = (String) mapCPIandCNDebtPOS.get("CPIandCNDebtPos");
                Text += "▶综合" + CNDebtWeight + "的国债权重和" + CPIWeight + "的反转cpi权重，现在国债和反转cpi的综合信号值为：" + CPIandCNDebtPos + "\n";
                Text += "  ◆ 计算公式为：" + CNDebtWeight + "*" + mapCPIandCNDebtPOS.get("CNDebtAvgPos") + " + " + CPIWeight + "*" + mapCPIandCNDebtPOS.get("CPIPosInverted") + "\n\n";
                // ----------------------------------
                Text += "▶货币基金优选兴业银行，偏债类基金优选兴业银行、易方达、华夏，股票基金优选易方达 > 广发 > 天弘 > 华夏 > 博时 > 南方 > 富国\n\n";
                // ------------------------------------
                Text += "▶信用卡优选工商银行、浦发银行、广发银行（待和同事讨论），日常消费优选工商、招商银行（待和同事讨论），房贷优选xx银行（待和同事讨论）\n\n";
                // m1-m2-------------------------------
                Map<String, Object> cnMoneySupplymap = getTextCNMoneySupply();
                double m1oneMonthAgo = (double) cnMoneySupplymap.get("m1oneMonthAgo");
                double m2oneMonthAgo = (double) cnMoneySupplymap.get("m2oneMonthAgo");
                String oneMonthAgoDate = (String) cnMoneySupplymap.get("oneMonthAgoDate");
                double MoneMonthAgo = m1oneMonthAgo - m2oneMonthAgo;

                double m1twoMonthAgo = (double) cnMoneySupplymap.get("m1twoMonthAgo");
                double m2twoMonthAgo = (double) cnMoneySupplymap.get("m2twoMonthAgo");
                String twoMonthAgoDate = (String) cnMoneySupplymap.get("twoMonthAgoDate");
                double MtwoMonthAgo = m1twoMonthAgo - m2twoMonthAgo;
                Text += "▶货币宽松量：\n";
                Text += "  ◆最新数据（" + oneMonthAgoDate + "），实际值为：" + new DecimalFormat("0.00%").format(MoneMonthAgo) + "\n";
                Text += "  ◆上一次（" + twoMonthAgoDate + "），实际值为：" + new DecimalFormat("0.00%").format(MtwoMonthAgo) + "\n";
                if (MoneMonthAgo < 0) {
                    Text += "  ◆结论：当前环境适合投资股票\n\n";
                } else {
                    Text += "  ◆结论：当前环境不适合投资股票\n\n";
                }
            } catch (Exception e) {
                System.out.println(e.getMessage() + "cpi和国债共同计算百分位 出错");
            }


            // -------------------
            map.put("subject", subject);
            map.put("Text", Text);
        } catch (Exception e) {
            System.out.println("wenben.exception==" + e.getMessage());
        }
        return map;
    }

    /**
     * 获取恒生指数基本面
     */
    public static Map<String, Object> calculateCPIandCNDebt(Map<String, String> cnDebtMap, Map<String, Object> mapCNCPI, double CNDebtWeight, double cpiWeight) throws IOException, ParseException {
        Map<String, Object> mapCPIandCNDebtPOS = new HashMap<>();
        // 最近十年：2、3、5、10年期的平均信号为
        double CNDebtAvgPos = Double.parseDouble(cnDebtMap.get("averagePos"));
        // 近10年，cpi信号
        String CPIPosStr = (String) mapCNCPI.get("CPIPos");
        // 去除最后的%
        String CPIPosDouble = CPIPosStr.substring(0, CPIPosStr.length() - 1);
        double CPIPos = Double.parseDouble(CPIPosDouble);
        // 取cpi相反数
        double CPIPosInverted = 1 - CPIPos / 100;
        // 计算结果,给国债CNDebtWeight的权重，给cpi相反数cpiWeight的权重
        double CPIandCNDebtPos = (CNDebtAvgPos * CNDebtWeight + CPIPosInverted * cpiWeight);
        mapCPIandCNDebtPOS.put("CNDebtAvgPos", new DecimalFormat("0.0000").format(CNDebtAvgPos));
        mapCPIandCNDebtPOS.put("CPIPosInverted", new DecimalFormat("0.0000").format(CPIPosInverted));
        mapCPIandCNDebtPOS.put("CPIandCNDebtPos", new DecimalFormat("0.00%").format(CPIandCNDebtPos));
        return mapCPIandCNDebtPOS;
    }

    /**
     * 获取恒生指数基本面
     */
    public static Map<String, Object> getTextHSI() throws IOException, ParseException {
        InputStream inputStream = request_indexFundamentalHSI.class.getClassLoader().getResourceAsStream("indexReqParam.yml");
        Map indexReqParam = new Yaml().load(inputStream);
        String indexFundamentalHSIURL = (String) indexReqParam.get("indexFundamentalHSIURL");
        String paramJson = getParam_indexFundamentalHSI.getSingleIndexParamJson();
        String resultJson = netRequest.jsonNetPost(indexFundamentalHSIURL, paramJson);
        indexFundamentalHSIResult_RootVO resultObj = (indexFundamentalHSIResult_RootVO) getResult_indexFundamentalHSI.getAllIndexResultObjHK(resultJson);
        double result = calculateFundamentalHSI(resultObj);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Map<String, Object> mapHSI = new HashMap<>();
        indexFundamentalHSIResult_DataVO vo = resultObj.getData().get(0);
        mapHSI.put("dateHSI", sdf.format(sdf.parse(vo.getDate())));
        mapHSI.put("posHSI", result);
        return mapHSI;
    }

    /**
     * 获取标普500基本面
     */
    public static Map<String, Object> getTextSPX() throws IOException, ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        InputStream inputStream = request_indexFundamentalSPX.class.getClassLoader().getResourceAsStream("indexReqParam.yml");
        Map indexReqParam = new Yaml().load(inputStream);
        String indexFundamentalUSURL = (String) indexReqParam.get("indexFundamentalUSURL");
        String paramJson = getParam_indexFundamentalSPX.getSingleIndexParamJson("");
        String resultJson = netRequest.jsonNetPost(indexFundamentalUSURL, paramJson);
        indexFundamentalSPXResult_RootVO resultObj = (indexFundamentalSPXResult_RootVO) getResult_indexFundamentalSPX.getResultObj(resultJson);
        double result = calculateFundamentalSPX(resultObj);
        Map<String, Object> mapSPX = new HashMap<>();
        indexFundamentalSPXResult_DataVO vo = resultObj.getData().get(0);
        mapSPX.put("dateSPX", sdf.format(vo.getDate()));
        mapSPX.put("posSPX", result);
        return mapSPX;

    }

    /**
     * 获取每日基本百分位
     */
    public static Map<String, String> getTextFundamentalCN() throws IOException, ParseException {
        Map<String, String> map = new HashMap<>();
        InputStream inputStream = request_indexFundamentalCN.class.getClassLoader().getResourceAsStream("indexReqParam.yml");
        Map indexReqParam = new Yaml().load(inputStream);
        String indexFundamentalCNURL = (String) indexReqParam.get("indexFundamentalCNURL");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.YEAR, -10);
        String startDate = sdf.format(cal.getTime());

        String paramJson = getParam_indexFundamentalCN.getSingleIndexParam_dateRangeJsonCN(startDate);
        String resultJson = netRequest.jsonNetPost(indexFundamentalCNURL, paramJson);
        indexFundamentalCNResult_RootVO resultFundamentalObj = (indexFundamentalCNResult_RootVO) getResult_indexFundamentalCN.getResultObjCN(resultJson);
        String fundamentalDate = String.valueOf(resultFundamentalObj.getData().get(0).getDate());
        String resultFundamental = String.valueOf(calculateFundamentalCN(resultFundamentalObj));
        map.put("fundamentalDate", fundamentalDate);
        map.put("resultFundamental", resultFundamental);
        return map;
    }

    /**
     * 获取货币供应量m1与m2
     */
    public static Map<String, Object> getTextCNMoneySupply() throws IOException, ParseException {
        Map<String, Object> map = new HashMap<>();
        InputStream inputStream = request_moneySupplyCN.class.getClassLoader().getResourceAsStream("indexReqParam.yml");
        Map indexReqParam = new Yaml().load(inputStream);
        String macroMoneySupplyURL = (String) indexReqParam.get("macroMoneySupplyURL");
        String paramJson = getParam_moneySupplyCN.getParamMoneySupplyCNParamJson();
        String resultJson = netRequest.jsonNetPost(macroMoneySupplyURL, paramJson);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        moneySupplyCNResult_RootVO resultObj = (moneySupplyCNResult_RootVO) getResult_moneySupplyCN.getResultObj(resultJson);
        moneySupplyCNParam_DataVO oneMonthAgoData = resultObj.getData().get(0);
        map.put("m1oneMonthAgo", oneMonthAgoData.getM().getM1().getT_y2y());
        map.put("m2oneMonthAgo", oneMonthAgoData.getM().getM2().getT_y2y());
        map.put("oneMonthAgoDate", sdf.format(sdf.parse(oneMonthAgoData.getDate())));

        moneySupplyCNParam_DataVO twoMonthAgoData = resultObj.getData().get(1);
        map.put("m1twoMonthAgo", twoMonthAgoData.getM().getM1().getT_y2y());
        map.put("m2twoMonthAgo", twoMonthAgoData.getM().getM2().getT_y2y());
        map.put("twoMonthAgoDate", sdf.format(sdf.parse(twoMonthAgoData.getDate())));
        return map;
    }

    /**
     * 获取cpi
     */
    public static Map<String, Object> getTextCNPriceIndex() throws IOException, ParseException {
        InputStream inputStream = request_PriceIndexCN.class.getClassLoader().getResourceAsStream("indexReqParam.yml");
        Map indexReqParam = new Yaml().load(inputStream);
        String macroPriceIndexCNURL = (String) indexReqParam.get("macroPriceIndexCNURL");
        String paramJson = getParam_PriceIndexCN.getParamPriceIndexCNParamJson();
        String resultJson = netRequest.jsonNetPost(macroPriceIndexCNURL, paramJson);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        PriceIndexCNResult_RootVO resultObj = (PriceIndexCNResult_RootVO) getResult_PriceIndexCN.getResultPriceIndexCNObj(resultJson);
        Map<String, Object> map = new HashMap<>();
        map.put("CNCPI0", new DecimalFormat("0.00%").format(resultObj.getData().get(0).getM().getCpi().getC_y2y()));
        map.put("CNCPI1", new DecimalFormat("0.00%").format(resultObj.getData().get(1).getM().getCpi().getC_y2y()));
        map.put("CNCPI2", new DecimalFormat("0.00%").format(resultObj.getData().get(2).getM().getCpi().getC_y2y()));
        map.put("CNCPI3", new DecimalFormat("0.00%").format(resultObj.getData().get(3).getM().getCpi().getC_y2y()));
        map.put("CNCPIDate", sdf.format(sdf.parse(resultObj.getData().get(0).getDate())));

        List<PriceIndexCNResult_DataVO> dataVOList = resultObj.getData();
        List<Double> tempList = new ArrayList<>();
        for (int i = 0; i < dataVOList.size(); i++) {
            tempList.add(dataVOList.get(i).getM().getCpi().getC_y2y());
        }
        Collections.sort(tempList);
        double nearestCpi = dataVOList.get(0).getM().getCpi().getC_y2y();
        double cpiPos = tempList.indexOf(nearestCpi) / (double) tempList.size();
        map.put("CPIPos", new DecimalFormat("0.00%").format(cpiPos));
        return map;
    }

    /**
     * 获取美债是否倒挂
     */
    public static Map<String, String> getTextUSDebt() throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.YEAR, -10);

        InputStream inputStream = request_nationDebt.class.getClassLoader().getResourceAsStream("indexReqParam.yml");
        Map indexReqParam = new Yaml().load(inputStream);
        String macroNationalDebtURL = (String) indexReqParam.get("macroNationalDebtURL");
        String paramJson = getParam_nationDebtUS.getNationDebtUSParamJson(sdf.format(cal.getTime()));
        String resultJson = netRequest.jsonNetPost(macroNationalDebtURL, paramJson);
        nationalDebtResult_RootVO resultObj = (nationalDebtResult_RootVO) getResult_nationDebtUS.getResultObj(resultJson);
        nationalDebtResult_DataVO latestDayVO = resultObj.getData().get(0);
        nationalDebtResult_DataVO oneMonthAgoVO = resultObj.getData().get(25);
        // 计算美债---------------------------------
        Map<String, String> map = calcultePos(resultObj);
        //----------------------
        double latestDayy2cn = latestDayVO.getTcm_y2();
        double latestDayy10cn = latestDayVO.getTcm_y10();
        double oneMonthAgoy2cn = oneMonthAgoVO.getTcm_y2();
        double oneMonthAgoy10cn = oneMonthAgoVO.getTcm_y10();
        if ((latestDayy2cn - latestDayy10cn) > 0 || (oneMonthAgoy2cn - oneMonthAgoy10cn) > 0) {
            String latestDayDebtUSInverted = String.format("%.2f", (latestDayy2cn - latestDayy10cn) * 100);
            String oneMonthAgoDebtUSInverted = String.format("%.2f", (oneMonthAgoy2cn - oneMonthAgoy10cn) * 100);
            map.put("latestDayDebtUSInverted", latestDayDebtUSInverted);
            map.put("oneMonthAgoDebtUSInverted", oneMonthAgoDebtUSInverted);
        }
        return map;
    }

    /**
     * 判断国债百分位
     */
    public static Map<String, String> getTextCNDebt() throws Exception {
        InputStream inputStream = request_nationDebt.class.getClassLoader().getResourceAsStream("indexReqParam.yml");
        Map indexReqParam = new Yaml().load(inputStream);
        String macroNationalDebtURL = (String) indexReqParam.get("macroNationalDebtURL");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.YEAR, -10);

        String paramJson = getParam_nationDebtCN.getNationDebtCNParamJson(sdf.format(cal.getTime()));
        String resultJson = netRequest.jsonNetPost(macroNationalDebtURL, paramJson);
        nationalDebtResult_RootVO resultObj = (nationalDebtResult_RootVO) getResult_nationDebtUS.getResultObj(resultJson);
        List<nationalDebtResult_DataVO> resultData = resultObj.getData();
        nationalDebtResult_DataVO latestDayVO = resultData.get(0);
        nationalDebtResult_DataVO oneMonthAgoVO = resultData.get(25);
        // 计算国债---------------------------------
        Map<String, String> map = calcultePos(resultObj);
        //----------------------
        double latestDayy2cn = latestDayVO.getTcm_y2();
        double latestDayy10cn = latestDayVO.getTcm_y10();
        double oneMonthAgoy2cn = oneMonthAgoVO.getTcm_y2();
        double oneMonthAgoy10cn = oneMonthAgoVO.getTcm_y10();
        if ((latestDayy2cn - latestDayy10cn) > 0 || (oneMonthAgoy2cn - oneMonthAgoy10cn) > 0) {
            String latestDayDebtCNInverted = String.format("%.2f", (latestDayy2cn - latestDayy10cn) * 100);
            String oneMonthAgoDebtCNInverted = String.format("%.2f", (oneMonthAgoy2cn - oneMonthAgoy10cn) * 100);
            map.put("latestDayDebtCNInverted", latestDayDebtCNInverted);
            map.put("oneMonthAgoDebtCNInverted", oneMonthAgoDebtCNInverted);
        }
        return map;

    }

    /**
     * 发送简单邮件:
     * sendSimpleMail方法的5个参数分别表示邮件发送者、收件人、抄送人、邮件主题以及邮件内容。
     *
     * @param from    发送者
     * @param to      收件人
     * @param cc      抄送人
     * @param subject 主题
     * @param Text    内容
     */
    public void sendSimpleMail(String from, String to, String cc, String subject, String Text) {
        // 简单邮件可以直接构建一个SimpleMailMessage对象进行配置，配置完成后，通过JavaMailSender将邮件发送出去。
        SimpleMailMessage simpMsg = new SimpleMailMessage();
        simpMsg.setFrom(from);
        simpMsg.setTo(to);
//        simpMsg.setCc(cc);
        simpMsg.setSubject(subject);
        simpMsg.setText(Text);
        javaMailSender.send(simpMsg);
        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        System.out.println("定时任务开启  定时任务开启时间 " + nowTime);

    }

    /**
     * 发送带附件的邮件
     *
     * @param from    发送者
     * @param to      收件人
     * @param subject 主题
     * @param content 内容
     * @param file    附件
     */
    public void sendAttachFileMail(String from, String to, String subject, String content, File file) {
        try {
            MimeMessage message = javaMailSender.createMimeMessage();
            /*
             * 这里使用MimeMessageHelper简化了邮件配置，
             * 它的构造方法的第二个参数true表示构造一个multipart message类型的邮件，
             * multipart message类型的邮件包含多个正文、附件以及内嵌资源，邮件的表现形式更加丰富
             */
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setFrom(from);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(content);
            helper.addAttachment(file.getName(), file);
            javaMailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    /**
     * 发送带图片资源的邮件
     *
     * @param from    发送者
     * @param to      收件人
     * @param subject 主题
     * @param content 内容
     * @param srcPath 图片资源路径
     * @param resIds  资源id
     */
    public void sendMailWithImg(String from, String to, String subject, String content, String[] srcPath, String[] resIds) {
        if (srcPath.length != resIds.length) {
            System.out.println("发送失败");
            return;
        }
        try {
            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setFrom(from);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(content, true);//第二个参数true表示邮件正文是HTML格式的，该参数不传默认为false。
            for (int i = 0; i < srcPath.length; i++) {
                FileSystemResource res = new FileSystemResource(new File(srcPath[i]));//通过FileSystemResource构造静态资源
                helper.addInline(resIds[i], res);//调用addInline方法将资源加入邮件对象中
            }
            javaMailSender.send(message);
        } catch (MessagingException e) {
            System.out.println("发送失败");
        }
    }

    public void sendHtmlMail(String from, String to, String subject, String content) {
        try {
            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo(to);
            helper.setFrom(from);
            helper.setSubject(subject);
            helper.setText(content, true);
            javaMailSender.send(message);
        } catch (MessagingException e) {
            System.out.println("发送失败");
        }
    }

    public static void main(String[] args) throws IOException, ParseException {
        Map<String, String> map = getText();
//        System.out.println("map.get(Text)===" + map.get("pringIndex1"));
        System.out.println("map.get(subject)===" + map.get("subject"));
        System.out.println("map.get(Text)===" + map.get("Text"));


    }
}
