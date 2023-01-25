package invest.lixinger.ruoyi.controller;

import mybatisNoSpringUtils.mybatisNoSpringUtils;
import invest.lixinger.index.fundamental.CN.VO.indexFundamentalCNResult_RootVO;
import invest.lixinger.ruoyi.entity.hsagVO;
import invest.lixinger.ruoyi.mapper.hsagMapper;
import org.junit.Test;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import static invest.lixinger.index.fundamental.CN.request_indexFundamental_dateRange.getRequest_fundamental_dateRangeCN;

/**
 * 计算百分位，并存入到数据库
 */
public class hsagController extends mybatisNoSpringUtils {

    @Test
    public void hsag() throws IOException, ParseException {
        Date startDate = nearestDateInDB();
        indexFundamentalCNResult_RootVO resultVO = getRequest_fundamental_dateRangeCN(startDate);
        calculateFundamental(resultVO);
        System.out.println(startDate);
    }

    // 计算综合百分位
    private void calculateFundamental(indexFundamentalCNResult_RootVO resultObj) {
        hsagMapper hsagmapper = session.getMapper(hsagMapper.class);
        for (int i = 0; i < resultObj.getData().size(); i++) {
            hsagVO vo = new hsagVO();
            Date currentDate = resultObj.getData().get(i).getDate();
            double spdw = resultObj.getData().get(i).getCp();

            double pe_10_cvpos = resultObj.getData().get(i).getPe_ttm().getY10().getMedian().getCvpos();
            double pb_10_cvpos = resultObj.getData().get(i).getPb().getY10().getMedian().getCvpos();
            double ps_10_cvpos = resultObj.getData().get(i).getPs_ttm().getY10().getMedian().getCvpos();

            double pe_20_cvpos = resultObj.getData().get(i).getPe_ttm().getY20().getMedian().getCvpos();
            double pb_20_cvpos = resultObj.getData().get(i).getPb().getY20().getMedian().getCvpos();
            double ps_20_cvpos = resultObj.getData().get(i).getPs_ttm().getY20().getMedian().getCvpos();
            double result = (pe_10_cvpos + pb_10_cvpos + ps_10_cvpos + pe_20_cvpos + pb_20_cvpos + ps_20_cvpos) / 6;
            // pe、pb、ps的具体数值
            double pe_cv = Double.parseDouble(String.format("%.2f", resultObj.getData().get(i).getPe_ttm().getY10().getMedian().getCv()));
            double pb_cv = Double.parseDouble(String.format("%.2f", resultObj.getData().get(i).getPb().getY10().getMedian().getCv()));
            double ps_cv = Double.parseDouble(String.format("%.2f", resultObj.getData().get(i).getPs_ttm().getY10().getMedian().getCv()));

            System.out.println(currentDate + "，的综合百分位为：" + new DecimalFormat("0.00%").format(result) );
            vo.setSj(currentDate);
            vo.setSpdw(spdw);
            vo.setPeCv(pe_cv);
            vo.setPbCv(pb_cv);
            vo.setPsCv(ps_cv);
            vo.setPePos10(pe_10_cvpos);
            vo.setPbPos10(pb_10_cvpos);
            vo.setPsPos10(ps_10_cvpos);
            vo.setPePos20(pe_20_cvpos);
            vo.setPbPos20(pb_20_cvpos);
            vo.setPsPos20(ps_20_cvpos);
            vo.setZonghePos(result);
            hsagmapper.insert(vo);
        }
    }

    // 统计在数据库中最新的时间
    public Date nearestDateInDB() {
        hsagMapper hsagmapper = session.getMapper(hsagMapper.class);
        hsagVO vo = hsagmapper.nearestDateInDB();
        Date date = vo.getSj();
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);
        calendar.add(Calendar.DATE, 1);
        return calendar.getTime();
    }

    public hsagController() throws FileNotFoundException {
    }
}
