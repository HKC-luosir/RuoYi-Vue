package com.ruoyi.project.system.controller;

import java.util.Date;
import java.util.List;

import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.system.domain.BySchool;
import com.ruoyi.project.system.service.IBySchoolService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 幼儿园机构Controller
 * 
 * @author tsbz
 * @date 2020-04-08
 */
@RestController
@RequestMapping("/system/school")
public class BySchoolController extends BaseController
{
    @Autowired
    private IBySchoolService bySchoolService;

    /**
     * 查询幼儿园机构列表
     */
    @PreAuthorize("@ss.hasPermi('system:school:list')")
    @GetMapping("/list")
    public TableDataInfo list(BySchool bySchool)
    {
        startPage();
        List<BySchool> list = bySchoolService.selectBySchoolList(bySchool);
        return getDataTable(list);
    }

    /**
     * 导出幼儿园机构列表
     */
    @PreAuthorize("@ss.hasPermi('system:school:export')")
    @Log(title = "幼儿园机构", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BySchool bySchool)
    {
        List<BySchool> list = bySchoolService.selectBySchoolList(bySchool);
        ExcelUtil<BySchool> util = new ExcelUtil<BySchool>(BySchool.class);
        return util.exportExcel(list, "school");
    }

    /**
     * 获取幼儿园机构详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:school:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(bySchoolService.selectBySchoolById(id));
    }

    /**
     * 新增幼儿园机构
     */
    @PreAuthorize("@ss.hasPermi('system:school:add')")
    @Log(title = "幼儿园机构", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BySchool bySchool)
    {
        bySchool.setCreateUser(SecurityUtils.getLoginUser().getUser().getUserId());
        bySchool.setCreateTime(new Date());
        return toAjax(bySchoolService.insertBySchool(bySchool));
    }

    /**
     * 修改幼儿园机构
     */
    @PreAuthorize("@ss.hasPermi('system:school:edit')")
    @Log(title = "幼儿园机构", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BySchool bySchool)
    {
        return toAjax(bySchoolService.updateBySchool(bySchool));
    }

    /**
     * 删除幼儿园机构
     */
    @PreAuthorize("@ss.hasPermi('system:school:remove')")
    @Log(title = "幼儿园机构", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(bySchoolService.deleteBySchoolByIds(ids));
    }
}
