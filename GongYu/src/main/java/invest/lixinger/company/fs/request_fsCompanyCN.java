package invest.lixinger.company.fs;

import invest.lixinger.company.fs.VO.fsCompanyCNResult_DataVO;
import invest.lixinger.company.fs.VO.fsCompanyCNResult_MVO;
import invest.lixinger.company.fs.VO.fsCompanyCNResult_PsVO;
import invest.lixinger.company.fs.VO.fsCompanyCNResult_RootVO;
import invest.lixinger.company.fsTypeOfCompany.VO.fsTypeOfCompanyCNResult_RootVO;
import invest.lixinger.ruoyi.entity.codeAndNameVO;
import invest.lixinger.ruoyi.mapper.codeAndNameMapper;
import invest.lixinger.utils.netRequest;
import mybatisNoSpringUtils.mybatisNoSpringUtils;
import org.junit.Test;
import org.yaml.snakeyaml.Yaml;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static invest.lixinger.company.fsTypeOfCompany.request_fsTypeOfCompanyCN.requestFsTypeOfCompanyCN;
import static mybatisNoSpringUtils.mybatisNoSpringUtils.session;

/**
 * 计算公司的财务报表，主要取roe、收入、利润
 */
public class request_fsCompanyCN extends mybatisNoSpringUtils {
    /**
     * 返回财务报表的总结果
     * @param vo 某一行业的所有公司，主要是用来获取股票代码
     * @param codeAndNameList 在数据库里面的股票代码与股票名称对照
     */
    public static Map<String, Map<String, String>> requestFsCompanyCN(fsTypeOfCompanyCNResult_RootVO vo, List<codeAndNameVO> codeAndNameList) throws IOException, ParseException {

        InputStream inputStream = request_fsCompanyCN.class.getClassLoader().getResourceAsStream("indexReqParam.yml");
        Map indexReqParam = new Yaml().load(inputStream);
        String fsType = (String) indexReqParam.get("fsType");
        String URL = "";
        if (fsType.equals("bank")) {
            URL = (String) indexReqParam.get("companyFsBankURLCN");
        } else if (fsType.equals("security")) {
            URL = (String) indexReqParam.get("companyFsSecurityURLCN");
        }else if (fsType.equals("insurance")) {
            URL = (String) indexReqParam.get("companyFsInsuranceURLCN");
        }
        String paramJson = getParam_fsCompanyCN.getParamFsCompanyCN(vo);
        String resultJson = netRequest.jsonNetPost(URL, paramJson);
//        String resultJson = "{\"code\":1,\"message\":\"success\",\"data\":[{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.0013660059658219732},\"npadnrpatoshaopc\":{\"t_y2y\":-0.027796626599457155}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.07058862860953581},\"wroe\":{\"t\":0.0669}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"600000\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.006483384602651291},\"npadnrpatoshaopc\":{\"t_y2y\":0.049938423645320196}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.0703189115848252},\"wroe\":{\"t\":0.0584}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"600015\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":-0.16870670187928197},\"npadnrpatoshaopc\":{\"t_y2y\":-0.051386508583148374}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.0683553734401192},\"wroe\":{\"t\":0.059925}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"600016\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.05339087546239211},\"npadnrpatoshaopc\":{\"t_y2y\":0.1425922352991618}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.13926620582974816},\"wroe\":{\"t\":0.13665}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"600036\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.06623003746056783},\"npadnrpatoshaopc\":{\"t_y2y\":0.1516472645189693}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.10015796501549679},\"wroe\":{\"t\":0.0951}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"600908\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.14880143978912977},\"npadnrpatoshaopc\":{\"t_y2y\":0.31515155193274663}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.1287927076730096},\"wroe\":{\"t\":0.1241}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"600919\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-27T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.16470669780141106},\"npadnrpatoshaopc\":{\"t_y2y\":0.3052522122474785}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.12121845296204606},\"wroe\":{\"t\":0.1171}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"600926\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":-0.0839269431689127},\"npadnrpatoshaopc\":{\"t_y2y\":-0.12198708513014728}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.06325106775284284},\"wroe\":{\"t\":0.0631}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"600928\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.16127480012089143},\"npadnrpatoshaopc\":{\"t_y2y\":0.19947877475061912}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.12708201272387826},\"wroe\":{\"t\":0.1252}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601009\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":-0.022103300674826482},\"npadnrpatoshaopc\":{\"t_y2y\":0.07435574444038943}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.08818649051555547},\"wroe\":{\"t\":0.0876}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601077\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-28T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.1861072950928362},\"npadnrpatoshaopc\":{\"t_y2y\":0.24785852113226375}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.10064264832458159},\"wroe\":{\"t\":0.10035}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601128\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.0414942059287887},\"npadnrpatoshaopc\":{\"t_y2y\":0.12428748645635412}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.11585455639895857},\"wroe\":{\"t\":0.1105}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601166\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.032280095614968966},\"npadnrpatoshaopc\":{\"t_y2y\":0.05675350262697023}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.08645156379770809},\"wroe\":{\"t\":0.084375}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601169\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-26T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.154057785934143},\"npadnrpatoshaopc\":{\"t_y2y\":0.18466965398606547}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.0863862135268804},\"wroe\":{\"t\":0.0832}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601187\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-27T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.005243618305286029},\"npadnrpatoshaopc\":{\"t_y2y\":0.024286340626119708}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.08934436864568147},\"wroe\":{\"t\":0.089475}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601229\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.03619583150577082},\"npadnrpatoshaopc\":{\"t_y2y\":0.0607263771817338}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.09324617873202272},\"wroe\":{\"t\":0.088425}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601288\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.05053758063709556},\"npadnrpatoshaopc\":{\"t_y2y\":0.052533828601751126}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.08352282297456629},\"wroe\":{\"t\":0.07755}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601328\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":-0.0009844219785898752},\"npadnrpatoshaopc\":{\"t_y2y\":0.05342087711520874}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.08852743036350065},\"wroe\":{\"t\":0.084675}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601398\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-31T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.10647202718692318},\"npadnrpatoshaopc\":{\"t_y2y\":0.18675104116707325}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.07339394268747151},\"wroe\":{\"t\":0.0768}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601528\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.10207434549388157},\"npadnrpatoshaopc\":{\"t_y2y\":0.13198885538655258}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.10458241853132091},\"wroe\":{\"t\":0.1042}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601577\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-27T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.07792060681831531},\"npadnrpatoshaopc\":{\"t_y2y\":0.1465870015092813}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.11227104720289842},\"wroe\":{\"t\":0.10425}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601658\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-25T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.17206715082299975},\"npadnrpatoshaopc\":{\"t_y2y\":0.19242828085966387}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.09010557520415106},\"wroe\":{\"t\":0.1095}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601665\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.0042816283889088695},\"npadnrpatoshaopc\":{\"t_y2y\":0.049784915400057354}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.09553997992945294},\"wroe\":{\"t\":0.109}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601818\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.07629314581046187},\"npadnrpatoshaopc\":{\"t_y2y\":0.18813266464397863}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.09223856497383814},\"wroe\":{\"t\":0.092}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601825\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.1607266135675339},\"npadnrpatoshaopc\":{\"t_y2y\":0.3003365344030315}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.1369882175658831},\"wroe\":{\"t\":0.1388}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601838\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-28T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.020394344875992263},\"npadnrpatoshaopc\":{\"t_y2y\":0.072982857435486}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.07841671655733551},\"wroe\":{\"t\":0.0774}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601860\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.18064627870150435},\"npadnrpatoshaopc\":{\"t_y2y\":0.09256261308446814}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.08855595821128234},\"wroe\":{\"t\":0.084225}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601916\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.009823752212105925},\"npadnrpatoshaopc\":{\"t_y2y\":0.0651866601156767}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.0961767606132562},\"wroe\":{\"t\":0.095775}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601939\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-27T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":-0.04746400088949809},\"npadnrpatoshaopc\":{\"t_y2y\":0.0476487530460544}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.09606051967717959},\"wroe\":{\"t\":0.0948}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601963\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.02575020720321702},\"npadnrpatoshaopc\":{\"t_y2y\":0.06254765477039624}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.08819872479343736},\"wroe\":{\"t\":0.083925}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601988\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.10495636645439536},\"npadnrpatoshaopc\":{\"t_y2y\":0.005787536892184445}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.08934132145070574},\"wroe\":{\"t\":0.0895}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601997\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-28T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.033686001108261705},\"npadnrpatoshaopc\":{\"t_y2y\":0.12941572008357147}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.0897644137446629},\"wroe\":{\"t\":0.083325}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"601998\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-28T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.06717039777311067},\"npadnrpatoshaopc\":{\"t_y2y\":0.19458082249501113}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.08910744763415225},\"wroe\":{\"t\":0.0863}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"603323\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-25T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.08707445553895747},\"npadnrpatoshaopc\":{\"t_y2y\":0.26232748378863135}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.1074901854190653},\"wroe\":{\"t\":0.1015}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"000001\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-24T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":-0.13773111607579994},\"npadnrpatoshaopc\":{\"t_y2y\":0.07813334261396673}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.04888024902092714},\"wroe\":{\"t\":0.0491}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"000563\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-28T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.152116878440249},\"npadnrpatoshaopc\":{\"t_y2y\":0.20655599915948727}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.12098354438380987},\"wroe\":{\"t\":0.1206}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"002142\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-26T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.2188353012695439},\"npadnrpatoshaopc\":{\"t_y2y\":0.16691748764592512}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.06861025462851822},\"wroe\":{\"t\":0.0687}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"002807\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.07030131220346156},\"npadnrpatoshaopc\":{\"t_y2y\":0.22142781788029522}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.09205475763111265},\"wroe\":{\"t\":0.09}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"002839\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-31T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.12345376377430894},\"npadnrpatoshaopc\":{\"t_y2y\":0.007458329790076348}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.0800275192501687},\"wroe\":{\"t\":0.081525}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"002936\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.1630487406305128},\"npadnrpatoshaopc\":{\"t_y2y\":0.054886173195944715}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.09314376833326588},\"wroe\":{\"t\":0.0762}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"002948\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-29T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":-0.048756642061913276},\"npadnrpatoshaopc\":{\"t_y2y\":0.03816800797776718}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.09263829768844975},\"wroe\":{\"t\":0.087825}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"002958\"},{\"reportType\":\"third_quarterly_report\",\"reportDate\":\"2022-10-24T00:00:00+08:00\",\"currency\":\"CNY\",\"standardDate\":\"2022-09-30T00:00:00+08:00\",\"q\":{\"ps\":{\"oi\":{\"t_y2y\":0.11494390069522369},\"npadnrpatoshaopc\":{\"t_y2y\":0.26055073252974115}},\"m\":{\"roe_adnrpatoshaopc\":{\"t\":0.09074446080845176},\"wroe\":{\"t\":0.0916}}},\"date\":\"2022-09-30T00:00:00+08:00\",\"stockCode\":\"002966\"}]}";
        fsCompanyCNResult_RootVO resultObj = (fsCompanyCNResult_RootVO) getResult_fsCompanyCN.getResultFsCompanyCN(resultJson);
        Map<String, Map<String, String>> doubleMap = getdoubleCompanyFsMap(resultObj.getData(), resultObj.getData().get(0).getDate(), codeAndNameList);

        return doubleMap;
    }

    /**
     * 对财务报表中的数据进行初步处理
     * @param voList 某一行业的财务报表，未处理的数据
     * @param date 时间
     * @param codeAndNameList 在数据库里面的股票代码与股票名称对照
     */
    public static Map<String, Map<String, String>> getdoubleCompanyFsMap(List<fsCompanyCNResult_DataVO> voList, String date, List<codeAndNameVO> codeAndNameList) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String dateFormat = sdf.format(sdf.parse(date));
        Map<String, Map<String, String>> doubleFsMap = new HashMap<>();
        for (int i = 0; i < voList.size(); i++) {
            for (int j = 0; j < codeAndNameList.size(); j++) {
                fsCompanyCNResult_DataVO vo = voList.get(i);
                fsCompanyCNResult_PsVO ps = vo.getQ().getPs();
                fsCompanyCNResult_MVO m = vo.getQ().getM();
                String stockCode = vo.getStockCode();
                // 从数据库中找到代码和股票名称对应
                if (stockCode.equals(codeAndNameList.get(j).getCode().substring(2))) {
                    Map<String, String> mapTemp = new HashMap<>();
                    mapTemp.put("wroe", String.valueOf(new DecimalFormat("0.0000").format(m.getWroe().getT())));
                    mapTemp.put("kroe", String.valueOf(new DecimalFormat("0.0000").format(m.getRoe_adnrpatoshaopc().getT())));
                    mapTemp.put("income", String.valueOf(new DecimalFormat("0.0000").format(ps.getOi().getT_y2y())));
                    mapTemp.put("profit", String.valueOf(new DecimalFormat("0.0000").format(ps.getNpadnrpatoshaopc().getT_y2y())));
                    mapTemp.put("date", dateFormat);
                    mapTemp.put("Name", codeAndNameList.get(j).getName());
                    doubleFsMap.put(vo.getStockCode(), mapTemp);
                }
            }
        }
        return getdoubleCompanyFsMapSort(voList, doubleFsMap);
    }

    /**
     * 对加权+扣非roe进行排序，得到排名
     * @param voList 某一行业的财务报表，未处理的数据
     * @param doubleFsMap 返回财务报表的排名，双map
     */
    public static Map<String, Map<String, String>> getdoubleCompanyFsMapSort(List<fsCompanyCNResult_DataVO> voList, Map<String, Map<String, String>> doubleFsMap) {
        voList.sort((x, y) -> Double.compare(y.getQ().getM().getWroe().getT(), x.getQ().getM().getWroe().getT()));
        for (Integer i = 0; i < voList.size(); i++) {
            String StockCode = voList.get(i).getStockCode();
            Map<String, String> mapWroeTemp = doubleFsMap.get(StockCode);
            mapWroeTemp.put("rankWRoe", String.valueOf(i));
            doubleFsMap.put(StockCode, mapWroeTemp);
        }
        voList.sort((x, y) -> Double.compare(y.getQ().getM().getRoe_adnrpatoshaopc().getT(), x.getQ().getM().getRoe_adnrpatoshaopc().getT()));
        for (Integer i = 0; i < voList.size(); i++) {
            String StockCode = voList.get(i).getStockCode();
            Map<String, String> mapKroeTemp = doubleFsMap.get(StockCode);
            mapKroeTemp.put("rankKRoe", String.valueOf(i));
            doubleFsMap.put(StockCode, mapKroeTemp);
        }
        return doubleFsMap;
    }

    public request_fsCompanyCN() throws FileNotFoundException {
    }

    @Test
    public void test() throws IOException, ParseException {
        fsTypeOfCompanyCNResult_RootVO vo = requestFsTypeOfCompanyCN();
        codeAndNameMapper codeAndNameMapper = session.getMapper(codeAndNameMapper.class);
        List<codeAndNameVO> codeAndNameList = codeAndNameMapper.findAll();
        requestFsCompanyCN(vo, codeAndNameList);
    }
}
