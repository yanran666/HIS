package com.ygt.medicalCheck.controller;

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
import com.ygt.medicalCheck.domain.medicalCheck;
import com.ygt.medicalCheck.service.ImedicalCheckService;
import com.ygt.common.utils.poi.ExcelUtil;
import com.ygt.common.core.page.TableDataInfo;

/**
 * 病历记录Controller
 * 
 * @author ruoyi
 * @date 2024-07-17
 */
@RestController
@RequestMapping("/medicalCheck/medicalCheck")
public class medicalCheckController extends BaseController
{
    @Autowired
    private ImedicalCheckService medicalCheckService;

    /**
     * 查询病历记录列表
     */
    @PreAuthorize("@ss.hasPermi('medicalCheck:medicalCheck:list')")
    @GetMapping("/list")
    public TableDataInfo list(medicalCheck medicalCheck)
    {
        startPage();
        List<medicalCheck> list = medicalCheckService.selectmedicalCheckList(medicalCheck);
        return getDataTable(list);
    }

    /**
     * 导出病历记录列表
     */
    @PreAuthorize("@ss.hasPermi('medicalCheck:medicalCheck:export')")
    @Log(title = "病历记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, medicalCheck medicalCheck)
    {
        List<medicalCheck> list = medicalCheckService.selectmedicalCheckList(medicalCheck);
        ExcelUtil<medicalCheck> util = new ExcelUtil<medicalCheck>(medicalCheck.class);
        util.exportExcel(response, list, "病历记录数据");
    }

    /**
     * 获取病历记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('medicalCheck:medicalCheck:query')")
    @GetMapping(value = "/{medicalRecordId}")
    public AjaxResult getInfo(@PathVariable("medicalRecordId") Long medicalRecordId)
    {
        return success(medicalCheckService.selectmedicalCheckByMedicalRecordId(medicalRecordId));
    }

    /**
     * 新增病历记录
     */
    @PreAuthorize("@ss.hasPermi('medicalCheck:medicalCheck:add')")
    @Log(title = "病历记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody medicalCheck medicalCheck)
    {
        return toAjax(medicalCheckService.insertmedicalCheck(medicalCheck));
    }

    /**
     * 修改病历记录
     */
    @PreAuthorize("@ss.hasPermi('medicalCheck:medicalCheck:edit')")
    @Log(title = "病历记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody medicalCheck medicalCheck)
    {
        return toAjax(medicalCheckService.updatemedicalCheck(medicalCheck));
    }

    /**
     * 删除病历记录
     */
    @PreAuthorize("@ss.hasPermi('medicalCheck:medicalCheck:remove')")
    @Log(title = "病历记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{medicalRecordIds}")
    public AjaxResult remove(@PathVariable Long[] medicalRecordIds)
    {
        return toAjax(medicalCheckService.deletemedicalCheckByMedicalRecordIds(medicalRecordIds));
    }
}
