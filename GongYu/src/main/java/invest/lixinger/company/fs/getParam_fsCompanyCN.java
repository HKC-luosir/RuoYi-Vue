package invest.lixinger.company.fs;


import com.alibaba.fastjson.JSON;
import invest.lixinger.company.fs.VO.fsCompanyCNParam_RootVO;
import invest.lixinger.company.fsTypeOfCompany.VO.fsTypeOfCompanyCNParam_RootVO;
import invest.lixinger.company.fsTypeOfCompany.VO.fsTypeOfCompanyCNResult_DataVO;
import invest.lixinger.company.fsTypeOfCompany.VO.fsTypeOfCompanyCNResult_RootVO;
import invest.lixinger.ruoyi.entity.codeAndNameVO;
import invest.lixinger.ruoyi.mapper.codeAndNameMapper;
import invest.lixinger.utils.getResult_NoHoliday;
import org.yaml.snakeyaml.Yaml;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static invest.lixinger.company.fsTypeOfCompany.request_fsTypeOfCompanyCN.requestFsTypeOfCompanyCN;
import static mybatisNoSpringUtils.mybatisNoSpringUtils.session;

public class getParam_fsCompanyCN {
    public static String getParamFsCompanyCN(fsTypeOfCompanyCNResult_RootVO vo) throws IOException, ParseException {
        InputStream inputStream = getParam_fsCompanyCN.class.getClassLoader().getResourceAsStream("indexReqParam.yml");
        Map indexReqParam = new Yaml().load(inputStream);
        String token = (String) indexReqParam.get("token");
        List<String> companyFsMetricsList = (List<String>) indexReqParam.get("companyFsMetricsList");

        fsCompanyCNParam_RootVO fsCompanyCNParam_rootVO = new fsCompanyCNParam_RootVO();
        fsCompanyCNParam_rootVO.setToken(token);

        fsCompanyCNParam_rootVO.setDate("latest");
        fsCompanyCNParam_rootVO.setMetricsList(companyFsMetricsList);

        List<fsTypeOfCompanyCNResult_DataVO> listVO = vo.getData();
        List<String> listStockCodes = new ArrayList<>();

        for (fsTypeOfCompanyCNResult_DataVO fsTypeOfCompanyCNResult_dataVO : listVO) {
            listStockCodes.add(fsTypeOfCompanyCNResult_dataVO.getStockCode());
        }
        fsCompanyCNParam_rootVO.setStockCodes(listStockCodes);
        return JSON.toJSONString(fsCompanyCNParam_rootVO);
    }

    public static void main(String[] args) throws IOException, ParseException {
        fsTypeOfCompanyCNResult_RootVO vo = requestFsTypeOfCompanyCN();

        System.out.println(getParamFsCompanyCN(vo));
    }


}
