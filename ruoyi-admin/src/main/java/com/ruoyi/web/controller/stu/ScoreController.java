package com.ruoyi.web.controller.stu;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.stu.domain.Score;
import com.ruoyi.stu.domain.StuCoursePlan;
import com.ruoyi.stu.domain.StuInfo;
import com.ruoyi.stu.domain.StuMaterial;
import com.ruoyi.stu.service.IStuCoursePlanService;
import com.ruoyi.stu.service.IStuScoreService;
import com.ruoyi.stu.vo.BiyeForm;
import com.ruoyi.stu.vo.StuInfoMaterial;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/stu/score")
public class ScoreController extends BaseController {

    @Autowired
    private IStuScoreService stuScoreService;

    @Autowired
    private IStuCoursePlanService stuCoursePlanService;

    /**
     * 查询已录入成绩的班级&老师&课程信息
     */
    @PreAuthorize("@ss.hasPermi('score:info:courseList')")
    @GetMapping("/list")
    public TableDataInfo list(String stuCls,String teaName, String courseName)
    {
        startPage();
        List<StuCoursePlan> list = stuCoursePlanService.findAll(stuCls, teaName,  courseName);
        return getDataTable(list);
    }
    /**
     *  查询各个年级的课程
     */
    @PreAuthorize("@ss.hasPermi('courseplan:info:courseplanList')")
    @GetMapping("/coursePlanList")
    public TableDataInfo courseplanlist(String clsYear,String courseName)
    {
        startPage();
        List<StuCoursePlan> list = stuCoursePlanService.findAllLevelCourse(clsYear,courseName);
        return getDataTable(list);
    }
    /**
     * 查询某个班级的成绩
     */
    @PreAuthorize("@ss.hasPermi('score:info:courseList')")
    @GetMapping("/courseScore")
    public TableDataInfo courseScore(String stuCls, String courseName)
    {
        startPage();
        List<Score> list = stuScoreService.selectCourseScore(stuCls,courseName);
        return getDataTable(list);
    }

    /**
     * 查询某个班级学生的平均成绩
     */
    @PreAuthorize("@ss.hasPermi('score:info:courseList')")
    @GetMapping("/hisScoure")
    public AjaxResult clsStuHisScore(String stuCls)
    {
        List<Score> list = stuScoreService.selectHistoryScore(stuCls);
        return success(list);
    }

    /**
     * 查询某个班级学生的平均成绩
     */
    @PreAuthorize("@ss.hasPermi('score:info:courseList')")
    @Log(title = "成绩录入", businessType = BusinessType.UPDATE)
    @PostMapping("/setScore")
    public AjaxResult edit(@RequestBody List<Score> scores)
    {
        return toAjax(stuScoreService.updateClassDailyScore(scores));
    }

    /**
     * 学生成绩导出
     */
    @PreAuthorize("@ss.hasPermi('score:info:export')")
    @Log(title = "成绩导出", businessType = BusinessType.UPDATE)
    @PostMapping("/export")
    public void export(HttpServletResponse response,String stuCls, String courseName)
    {
        List<Score> list = stuScoreService.selectCourseScore(stuCls,courseName);
        ExcelUtil<Score> util = new ExcelUtil<Score>(Score.class);
        util.exportExcel(response, list, "提交材料参数数据");
    }
}
