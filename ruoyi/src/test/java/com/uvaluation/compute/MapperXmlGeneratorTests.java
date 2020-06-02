package com.uvaluation.compute;

import com.ruoyi.project.data.price.domain.ComputeResidenceRentBasePrice;
import com.ruoyi.project.data.price.domain.UltimateResidenceRentBasePrice;
import org.junit.Assert;
import org.junit.Test;

import java.lang.reflect.Field;
import java.util.*;

public class MapperXmlGeneratorTests {

    @Test
    public void generateBatchInsertSqL() {
        Class targetClass = UltimateResidenceRentBasePrice .class;
        List<Field> fieldList = new ArrayList<>();
        fieldList.addAll(new ArrayList<>(Arrays.asList(targetClass.getDeclaredFields())));
//        while (targetClass != null) {
//            fieldList.addAll(new ArrayList<>(Arrays.asList(targetClass.getDeclaredFields())));
//            targetClass = targetClass.getSuperclass();
//        }
        Field[] fields = new Field[fieldList.size()];
        fieldList.toArray(fields);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < fields.length; i++) {
            String name = fields[i].getName();
            sb.append("<result property=\""+name+"\" column=\""+name+"\"/>\r\n");
        }
        System.out.println(sb.toString());
    }

    @Test
    public void testDate(){
        Calendar calendar = Calendar.getInstance();
        calendar.set(202006 / 100, 202006 % 100, 1);
        Integer lastYearMonth =  new Integer(String.format("%d%02d", calendar.get(Calendar.YEAR),
                calendar.get(Calendar.MONTH)-1));
        Assert.assertTrue(Objects.equals(lastYearMonth,202005));
    }
}
