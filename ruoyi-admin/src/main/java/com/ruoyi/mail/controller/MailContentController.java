package com.ruoyi.mail.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.mail.domain.MailContent;
import com.ruoyi.mail.service.IMailContentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 晚安语列表Controller
 * 
 * @author ruoyi
 * @date 2023-10-21
 */
@RestController
@RequestMapping("/system/content")
public class MailContentController extends BaseController
{
    @Autowired
    private IMailContentService mailContentService;

    /**
     * 查询晚安语列表列表
     */
    @PreAuthorize("@ss.hasPermi('system:content:list')")
    @GetMapping("/list")
    public TableDataInfo list(MailContent mailContent)
    {
        startPage();
        List<MailContent> list = mailContentService.selectMailContentList(mailContent);
        return getDataTable(list);
    }

    /**
     * 导出晚安语列表列表
     */
    @PreAuthorize("@ss.hasPermi('system:content:export')")
    @Log(title = "晚安语列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MailContent mailContent)
    {
        List<MailContent> list = mailContentService.selectMailContentList(mailContent);
        ExcelUtil<MailContent> util = new ExcelUtil<MailContent>(MailContent.class);
        util.exportExcel(response, list, "晚安语列表数据");
    }

    /**
     * 获取晚安语列表详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:content:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(mailContentService.selectMailContentById(id));
    }

    /**
     * 新增晚安语列表
     */
    @PreAuthorize("@ss.hasPermi('system:content:add')")
    @Log(title = "晚安语列表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MailContent mailContent)
    {
        return toAjax(mailContentService.insertMailContent(mailContent));
    }

    /**
     * 修改晚安语列表
     */
    @PreAuthorize("@ss.hasPermi('system:content:edit')")
    @Log(title = "晚安语列表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MailContent mailContent)
    {
        return toAjax(mailContentService.updateMailContent(mailContent));
    }

    /**
     * 删除晚安语列表
     */
    @PreAuthorize("@ss.hasPermi('system:content:remove')")
    @Log(title = "晚安语列表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(mailContentService.deleteMailContentByIds(ids));
    }
}
