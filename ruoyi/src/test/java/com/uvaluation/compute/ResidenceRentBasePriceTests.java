package com.uvaluation.compute;

import com.ruoyi.RuoYiApplication;
import com.ruoyi.project.data.cases.service.IOriginalResidenceRentClosingCaseService;
import com.ruoyi.project.data.cases.service.IOriginalResidenceRentOpeningCaseService;
import com.ruoyi.project.data.cases.service.IOriginalResidenceSaleClosingCaseService;
import com.ruoyi.project.data.cases.service.IOriginalResidenceSaleOpeningCaseService;
import com.ruoyi.project.data.price.domain.ComputeResidenceSaleBasePrice;
import com.ruoyi.project.data.price.service.IArtificialResidenceSalePriceService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigDecimal;
import java.util.LinkedList;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = RuoYiApplication.class)
@ActiveProfiles("uat")
public class ResidenceRentBasePriceTests {

    @Autowired
    private IOriginalResidenceRentOpeningCaseService originalResidenceRentOpeningCaseService;
    @Autowired
    private IOriginalResidenceRentClosingCaseService originalResidenceRentClosingCaseService;

    @Test
    public void testClearOpeningCase() {
        originalResidenceRentOpeningCaseService.pullData();
    }

    @Test
    public void testClearClosingCase() {
        originalResidenceRentClosingCaseService.pullData();
    }

}
