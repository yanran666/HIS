package com.ygt.cancel_appointment.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Qualifier;
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
import com.ygt.cancel_appointment.domain.CancelAppointments;
import com.ygt.cancel_appointment.service.ICancelAppointmentsService;
import com.ygt.common.utils.poi.ExcelUtil;
import com.ygt.common.core.page.TableDataInfo;

/**
 * 退号Controller
 * 
 * @author yhp
 * @date 2024-07-08
 */
@RestController
@RequestMapping("/cancel_appointment/cancel_appointment")
public class CancelAppointmentsController extends BaseController
{
    @Autowired
    private ICancelAppointmentsService cancelAppointmentsService;

    /**
     * 查询退号列表
     */
    @PreAuthorize("@ss.hasPermi('cancel_appointment:cancel_appointment:list')")
    @GetMapping("/list")
    public TableDataInfo list(CancelAppointments cancelAppointments)
    {
        startPage();
        List<CancelAppointments> list = cancelAppointmentsService.selectCancelAppointmentsList(cancelAppointments);
        return getDataTable(list);
    }

//    /**
//     * 导出退号列表
//     */
//    @PreAuthorize("@ss.hasPermi('cancel_appointment:cancel_appointment:export')")
//    @Log(title = "退号", businessType = BusinessType.EXPORT)
//    @PostMapping("/export")
//    public void export(HttpServletResponse response, CancelAppointments cancelAppointments)
//    {
//        List<CancelAppointments> list = cancelAppointmentsService.selectCancelAppointmentsList(cancelAppointments);
//        ExcelUtil<CancelAppointments> util = new ExcelUtil<CancelAppointments>(CancelAppointments.class);
//        util.exportExcel(response, list, "退号数据");
//    }

//    /**
//     * 获取退号详细信息
//     */
//    @PreAuthorize("@ss.hasPermi('cancel_appointment:cancel_appointment:query')")
//    @GetMapping(value = "/{appointmentId}")
//    public AjaxResult getInfo(@PathVariable("appointmentId") Long appointmentId)
//    {
//        return success(cancelAppointmentsService.selectCancelAppointmentsByAppointmentId(appointmentId));
//    }

//    /**
//     * 新增退号
//     */
//    @PreAuthorize("@ss.hasPermi('cancel_appointment:cancel_appointment:add')")
//    @Log(title = "退号", businessType = BusinessType.INSERT)
//    @PostMapping
//    public AjaxResult add(@RequestBody CancelAppointments cancelAppointments)
//    {
//        return toAjax(cancelAppointmentsService.insertCancelAppointments(cancelAppointments));
//    }

//    /**
//     * 修改退号
//     */
//    @PreAuthorize("@ss.hasPermi('cancel_appointment:cancel_appointment:edit')")
//    @Log(title = "退号", businessType = BusinessType.UPDATE)
//    @PutMapping
//    public AjaxResult edit(@RequestBody CancelAppointments cancelAppointments)
//    {
//        return toAjax(cancelAppointmentsService.updateCancelAppointments(cancelAppointments));
//    }

    /**
     * 删除退号
     */
    @PreAuthorize("@ss.hasPermi('cancel_appointment:cancel_appointment:remove')")
    @Log(title = "退号", businessType = BusinessType.DELETE)
	@DeleteMapping("/{appointmentIds}")
    public AjaxResult remove(@PathVariable Long[] appointmentIds)
    {
        return toAjax(cancelAppointmentsService.deleteCancelAppointmentsByAppointmentIds(appointmentIds));
    }
}
