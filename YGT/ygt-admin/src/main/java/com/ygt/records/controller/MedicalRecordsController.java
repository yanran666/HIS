package com.ygt.records.controller;

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
import com.ygt.records.domain.MedicalRecords;
import com.ygt.records.service.IMedicalRecordsService;
import com.ygt.common.utils.poi.ExcelUtil;
import com.ygt.common.core.page.TableDataInfo;

/**
 * 病历Controller
 * 
 * @author yhp
 * @date 2024-07-09
 */
@RestController
@RequestMapping("/records/records")
public class MedicalRecordsController extends BaseController
{
    @Autowired
    private IMedicalRecordsService medicalRecordsService;

    /**
     * 查询病历列表
     */
    @PreAuthorize("@ss.hasPermi('records:records:list')")
    @GetMapping("/list")
    public TableDataInfo list(MedicalRecords medicalRecords)
    {
        startPage();
        List<MedicalRecords> list = medicalRecordsService.selectMedicalRecordsList(medicalRecords);
        return getDataTable(list);
    }

    /**
     * 导出病历列表
     */
    @PreAuthorize("@ss.hasPermi('records:records:export')")
    @Log(title = "病历", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MedicalRecords medicalRecords)
    {
        List<MedicalRecords> list = medicalRecordsService.selectMedicalRecordsList(medicalRecords);
        ExcelUtil<MedicalRecords> util = new ExcelUtil<MedicalRecords>(MedicalRecords.class);
        util.exportExcel(response, list, "病历数据");
    }

    /**
     * 获取病历详细信息
     */
    @PreAuthorize("@ss.hasPermi('records:records:query')")
    @GetMapping(value = "/{medicalRecordId}")
    public AjaxResult getInfo(@PathVariable("medicalRecordId") Long medicalRecordId)
    {
        return success(medicalRecordsService.selectMedicalRecordsByMedicalRecordId(medicalRecordId));
    }

    /**
     * 新增病历
     */
    @PreAuthorize("@ss.hasPermi('records:records:add')")
    @Log(title = "病历", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MedicalRecords medicalRecords)
    {
        return toAjax(medicalRecordsService.insertMedicalRecords(medicalRecords));
    }

    /**
     * 修改病历
     */
    @PreAuthorize("@ss.hasPermi('records:records:edit')")
    @Log(title = "病历", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MedicalRecords medicalRecords)
    {
        return toAjax(medicalRecordsService.updateMedicalRecords(medicalRecords));
    }

    /**
     * 删除病历
     */
    @PreAuthorize("@ss.hasPermi('records:records:remove')")
    @Log(title = "病历", businessType = BusinessType.DELETE)
	@DeleteMapping("/{medicalRecordIds}")
    public AjaxResult remove(@PathVariable Long[] medicalRecordIds)
    {
        return toAjax(medicalRecordsService.deleteMedicalRecordsByMedicalRecordIds(medicalRecordIds));
    }
}
