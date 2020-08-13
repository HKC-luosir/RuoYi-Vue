package com.ruoyi.project.benyi.controller;

import java.util.List;

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
import com.ruoyi.project.benyi.domain.ByChildContactpeople;
import com.ruoyi.project.benyi.service.IByChildContactpeopleService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 幼儿紧急情况联系人Controller
 *
 * @author tsbz
 * @date 2020-08-13
 */
@RestController
@RequestMapping("/benyi/contactpeople")
public class ByChildContactpeopleController extends BaseController {
    @Autowired
    private IByChildContactpeopleService byChildContactpeopleService;

    /**
     * 查询幼儿紧急情况联系人列表
     */
    @PreAuthorize("@ss.hasPermi('benyi:contactpeople:list')")
    @GetMapping("/list")
    public TableDataInfo list(ByChildContactpeople byChildContactpeople) {
        startPage();
        List<ByChildContactpeople> list = byChildContactpeopleService.selectByChildContactpeopleList(byChildContactpeople);
        return getDataTable(list);
    }

    /**
     * 导出幼儿紧急情况联系人列表
     */
    @PreAuthorize("@ss.hasPermi('benyi:contactpeople:export')")
    @Log(title = "幼儿紧急情况联系人", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ByChildContactpeople byChildContactpeople) {
        List<ByChildContactpeople> list = byChildContactpeopleService.selectByChildContactpeopleList(byChildContactpeople);
        ExcelUtil<ByChildContactpeople> util = new ExcelUtil<ByChildContactpeople>(ByChildContactpeople.class);
        return util.exportExcel(list, "contactpeople");
    }

    /**
     * 获取幼儿紧急情况联系人详细信息
     */
    @PreAuthorize("@ss.hasPermi('benyi:contactpeople:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(byChildContactpeopleService.selectByChildContactpeopleById(id));
    }

    /**
     * 新增幼儿紧急情况联系人
     */
    @PreAuthorize("@ss.hasPermi('benyi:contactpeople:add')")
    @Log(title = "幼儿紧急情况联系人", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ByChildContactpeople byChildContactpeople) {
        return toAjax(byChildContactpeopleService.insertByChildContactpeople(byChildContactpeople));
    }

    /**
     * 修改幼儿紧急情况联系人
     */
    @PreAuthorize("@ss.hasPermi('benyi:contactpeople:edit')")
    @Log(title = "幼儿紧急情况联系人", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ByChildContactpeople byChildContactpeople) {
        return toAjax(byChildContactpeopleService.updateByChildContactpeople(byChildContactpeople));
    }

    /**
     * 删除幼儿紧急情况联系人
     */
    @PreAuthorize("@ss.hasPermi('benyi:contactpeople:remove')")
    @Log(title = "幼儿紧急情况联系人", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(byChildContactpeopleService.deleteByChildContactpeopleByIds(ids));
    }
}
