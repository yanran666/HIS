package com.ygt.examination.controller;

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
import com.ygt.common.annotation.Log;
import com.ygt.common.core.controller.BaseController;
import com.ygt.common.core.domain.AjaxResult;
import com.ygt.common.enums.BusinessType;
import com.ygt.examination.domain.Examination;
import com.ygt.examination.service.IExaminationService;
import com.ygt.common.utils.poi.ExcelUtil;
import com.ygt.common.core.page.TableDataInfo;

/**
 * 检查Controller
 * 
 * @author ruoyi
 * @date 2024-07-11
 */
@RestController
@RequestMapping("/examination/examination")
public class ExaminationController extends BaseController
{
    @Autowired
    private IExaminationService examinationService;

    /**
     * 查询检查列表
     */
    @PreAuthorize("@ss.hasPermi('examination:examination:list')")
    @GetMapping("/list")
    public TableDataInfo list(Examination examination)
    {
        startPage();
        List<Examination> list = examinationService.selectExaminationList(examination);
        return getDataTable(list);
    }

    /**
     * 导出检查列表
     */
    @PreAuthorize("@ss.hasPermi('examination:examination:export')")
    @Log(title = "检查", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Examination examination)
    {
        List<Examination> list = examinationService.selectExaminationList(examination);
        ExcelUtil<Examination> util = new ExcelUtil<Examination>(Examination.class);
        util.exportExcel(response, list, "检查数据");
    }

    /**
     * 获取检查详细信息
     */
    @PreAuthorize("@ss.hasPermi('examination:examination:query')")
    @GetMapping(value = "/{examId}")
    public AjaxResult getInfo(@PathVariable("examId") Long examId)
    {
        return success(examinationService.selectExaminationByExamId(examId));
    }

    /**
     * 新增检查
     */
    @PreAuthorize("@ss.hasPermi('examination:examination:add')")
    @Log(title = "检查", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Examination examination)
    {
        return toAjax(examinationService.insertExamination(examination));
    }

    /**
     * 修改检查
     */
    @PreAuthorize("@ss.hasPermi('examination:examination:edit')")
    @Log(title = "检查", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Examination examination)
    {
        return toAjax(examinationService.updateExamination(examination));
    }

    /**
     * 删除检查
     */
    @PreAuthorize("@ss.hasPermi('examination:examination:remove')")
    @Log(title = "检查", businessType = BusinessType.DELETE)
	@DeleteMapping("/{examIds}")
    public AjaxResult remove(@PathVariable Long[] examIds)
    {
        return toAjax(examinationService.deleteExaminationByExamIds(examIds));
    }
}
