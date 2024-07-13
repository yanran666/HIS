package com.ygt.patient.controller;

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
import com.ygt.patient.domain.patientCheck;
import com.ygt.patient.service.IpatientCheckService;
import com.ygt.common.utils.poi.ExcelUtil;
import com.ygt.common.core.page.TableDataInfo;

/**
 * 患者查看Controller
 * 
 * @author jzy
 * @date 2024-07-09
 */
@RestController
@RequestMapping("/patient/patientCheck")
public class patientCheckController extends BaseController
{
    @Autowired
    private IpatientCheckService patientCheckService;

    /**
     * 查询患者查看列表
     */
    @PreAuthorize("@ss.hasPermi('patient:patientCheck:list')")
    @GetMapping("/list")
    public TableDataInfo list(patientCheck patientCheck)
    {
        startPage();
        List<patientCheck> list = patientCheckService.selectpatientCheckList(patientCheck);
        return getDataTable(list);
    }

//    /**
//     * 导出患者查看列表
//     */
//    @PreAuthorize("@ss.hasPermi('patient:patientCheck:export')")
//    @Log(title = "患者查看", businessType = BusinessType.EXPORT)
//    @PostMapping("/export")
//    public void export(HttpServletResponse response, patientCheck patientCheck)
//    {
//        List<patientCheck> list = patientCheckService.selectpatientCheckList(patientCheck);
//        ExcelUtil<patientCheck> util = new ExcelUtil<patientCheck>(patientCheck.class);
//        util.exportExcel(response, list, "患者查看数据");
//    }

    /**
     * 获取患者查看详细信息
     */
    @PreAuthorize("@ss.hasPermi('patient:patientCheck:query')")
    @GetMapping(value = "/{appointmentId}")
    public AjaxResult getInfo(@PathVariable("appointmentId") Long appointmentId)
    {
        return success(patientCheckService.selectpatientCheckByAppointmentId(appointmentId));
    }

//    /**
//     * 新增患者查看
//     */
//    @PreAuthorize("@ss.hasPermi('patient:patientCheck:add')")
//    @Log(title = "患者查看", businessType = BusinessType.INSERT)
//    @PostMapping
//    public AjaxResult add(@RequestBody patientCheck patientCheck)
//    {
//        return toAjax(patientCheckService.insertpatientCheck(patientCheck));
//    }

    /**
     * 修改患者查看
     */
    @PreAuthorize("@ss.hasPermi('patient:patientCheck:edit')")
    @Log(title = "患者查看", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody patientCheck patientCheck)
    {
        return toAjax(patientCheckService.updatepatientCheck(patientCheck));
    }

    /**
     * 删除患者查看
     */
    @PreAuthorize("@ss.hasPermi('patient:patientCheck:remove')")
    @Log(title = "患者查看", businessType = BusinessType.DELETE)
	@DeleteMapping("/{appointmentIds}")
    public AjaxResult remove(@PathVariable Long[] appointmentIds)
    {
        return toAjax(patientCheckService.deletepatientCheckByAppointmentIds(appointmentIds));
    }
}
