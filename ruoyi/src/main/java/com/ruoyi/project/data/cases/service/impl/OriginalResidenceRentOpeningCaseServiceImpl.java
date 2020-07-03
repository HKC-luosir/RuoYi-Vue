package com.ruoyi.project.data.cases.service.impl;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.ruoyi.common.utils.LoadUtil;
import com.ruoyi.project.data.cases.domain.OriginalResidencePlatformRentOpeningCase;
import com.ruoyi.project.data.cases.domain.OriginalResidenceRentOpeningCase;
import com.ruoyi.project.data.cases.domain.OriginalResidenceSaleOpeningCase;
import com.ruoyi.project.data.cases.mapper.OriginalResidenceRentOpeningCaseMapper;
import com.ruoyi.project.data.cases.mapper.OriginalResidenceSaleOpeningCaseMapper;
import com.ruoyi.project.data.cases.mapper.sync.*;
import com.ruoyi.project.data.cases.service.IOriginalResidenceRentOpeningCaseService;
import com.ruoyi.project.data.cases.service.IOriginalResidenceSaleOpeningCaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSourceUtils;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
@DS("compute")
public class OriginalResidenceRentOpeningCaseServiceImpl implements IOriginalResidenceRentOpeningCaseService {

    private static Logger logger = LoggerFactory.getLogger(OriginalResidenceRentOpeningCaseServiceImpl.class);

    @Autowired
    private OriginalResidenceRentOpeningCaseMapper originalResidenceRentOpeningCaseMapper;
    @Autowired
    private DownloadOriginalResidenceRentOpeningCaseMapper downloadOriginalResidenceRentOpeningCaseMapper;
    @Autowired
    private SyncOriginalResidenceRentOpeningCaseMapper syncOriginalResidenceRentOpeningCaseMapper;
    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private DownloadOriginalResidenceRentPlatformCaseMapper downloadOriginalResidenceRentPlatformCaseMapper;

    /**
     * 29号拉取挂牌案例
     */
    @Scheduled(cron = "0 0 5 29 * ?")
    @Override
    public void pullData() {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        Integer syncTableRoute = new Integer(String.format("%d%02d", calendar.get(Calendar.YEAR),
                calendar.get(Calendar.MONTH)));
        Integer lastYearMonth = new Integer(String.format("%d%02d", calendar.get(Calendar.YEAR),
                calendar.get(Calendar.MONTH) + 1));
        calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), 1);
        Date startDate = calendar.getTime();
        calendar.add(Calendar.MONTH, 1);
        Integer computeTableRoute = new Integer(String.format("%d%02d", calendar.get(Calendar.YEAR),
                calendar.get(Calendar.MONTH) + 1));
        Date endDate = calendar.getTime();

        computeTableRoute = 202007;
        lastYearMonth = 202006;
        syncTableRoute = 202005;

        calendar.set(2020, 5, 15);
        startDate = calendar.getTime();
        calendar.set(2020, 6, 15);
        endDate = calendar.getTime();


        prepare(computeTableRoute, syncTableRoute);
        List<OriginalResidenceRentOpeningCase> list = downloadOriginalResidenceRentOpeningCaseMapper.download();
        List<OriginalResidencePlatformRentOpeningCase> platformCaseList =
                downloadOriginalResidenceRentPlatformCaseMapper.download(startDate, endDate);
//        list.parallelStream().forEach(originalResidenceOpeningCase -> {
////            originalResidenceOpeningCase.clear();
//            originalResidenceOpeningCase.setYearMonth(syncTableRoute);
//            syncOriginalResidenceRentOpeningCaseMapper.insert(originalResidenceOpeningCase);
//        });

        // 两种数据，分别插入不同的表当中
        running(computeTableRoute, list, platformCaseList);
        after(computeTableRoute, lastYearMonth, startDate);
    }

    /**
     * 准备工作 创建表
     *
     * @param computeTableRoute
     * @param syncTableRoute
     */
    public void prepare(Integer computeTableRoute, Integer syncTableRoute) {
        originalResidenceRentOpeningCaseMapper.createTable(computeTableRoute);
        originalResidenceRentOpeningCaseMapper.createCleanTable(computeTableRoute);
        originalResidenceRentOpeningCaseMapper.createPlatformCaseTable(computeTableRoute);
        originalResidenceRentOpeningCaseMapper.createAssembleTable(computeTableRoute);
        originalResidenceRentOpeningCaseMapper.createComputePriceTable(computeTableRoute);
        originalResidenceRentOpeningCaseMapper.createArtificialPriceTable(computeTableRoute);
        originalResidenceRentOpeningCaseMapper.createUltimatePriceTable(computeTableRoute);

//        syncOriginalResidenceRentOpeningCaseMapper.createTable(syncTableRoute);
    }

    /**
     * 批量入库
     *
     * @param computeTableRoute
     * @param lianjiaList
     */
    public void running(Integer computeTableRoute, List<OriginalResidenceRentOpeningCase> lianjiaList,
                        List<OriginalResidencePlatformRentOpeningCase> platformCaseList) {
        SqlParameterSource[] batchParams = SqlParameterSourceUtils.createBatch(lianjiaList.toArray());
        int[] updateCounts = namedParameterJdbcTemplate.batchUpdate("insert into dbo" +
                        ".ODS_HOUSINGCASELISTED_RENT_LJ_" + computeTableRoute + "_RAW (case_id, Llid,Lcid,Airaid," +
                        "Name,Type,Roomtype,Area,TotalArea,Towards,Storey,Visited_Num,First_Visit_Time," +
                        "Visited_Num_15,Visited_Num_30,Decoration,Address," +
                        "StatusTxt,Price,Url,Curl,Cname,SynDate) values " +
                        "(:newCaseId,:caseLianJiaId,:caseLianJiaCommunityId,:cleanCommunityId,:caseTitle," +
                        ":caseRentType," +
                        ":caseApartmentLayout,:caseArea,:caseTotalArea,:caseToward,:caseStorey,:caseVisitedNum," +
                        ":caseFirstVisitTime,:caseVisitedNum15,:caseVisitedNum30,:caseDecoration,:caseAddress," +
                        ":caseStatus,:casePrice,:caseUrl,:caseCommunityUrl,:caseCommunityName,GETDATE());",
                batchParams);

        // 租赁平台案例入库
        batchParams = SqlParameterSourceUtils.createBatch(platformCaseList.toArray());
        updateCounts = namedParameterJdbcTemplate.batchUpdate("insert into dbo" +
                        ".residence_rent_platform_case_" + computeTableRoute + " (case_id,case_area,case_block," +
                        "case_address,case_community_name,case_url,case_decoration,case_floor,case_hall_num,case_no," +
                        "case_price,case_county,case_rent_type,case_room_num,case_source,savetime) values " +
                        "(:newCaseId,:caseArea,:caseBlock,:caseAddress,:caseCommunityName,:caseUrl," +
                        ":caseDecoration," +
                        ":caseStorey,:caseHallNum,:caseNo,:casePrice,:caseCounty,:caseRentType,:caseRoomNum," +
                        ":caseProvider,:caseGetDate);",
                batchParams);
    }

    /**
     * 匹配数据
     * 计算基价
     *
     * @param yearMonth
     * @param lastYearMonth
     * @param valuePoint
     */
    public void after(Integer yearMonth, Integer lastYearMonth, Date valuePoint) {
        // 清洗挂牌案例
        String rawSql = LoadUtil.loadContent("sql-template/clear_rent_opening_case.sql");
        String sql = rawSql.replace("#yearMonth#", yearMonth.toString())
                .replace("#lastYearMonth#", lastYearMonth.toString());
        jdbcTemplate.update(sql);

//        // 作价
//        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
//        rawSql = LoadUtil.loadContent("sql-template/compute_residence_sale_base_price.sql");
//        sql = rawSql.replace("#yearMonth#", yearMonth.toString())
//                .replace("#lastYearMonth#", lastYearMonth.toString())
//                .replace("#valuePoint#", simpleDateFormat.format(valuePoint));
//        jdbcTemplate.update(sql);

        logger.debug("#作价完成#");
    }
}
