package com.ygt.appointment.controller;


import java.util.List;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
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
import com.ygt.appointment.domain.Appointments;
import com.ygt.appointment.service.IAppointmentsService;
import com.ygt.common.utils.poi.ExcelUtil;
import com.ygt.common.core.page.TableDataInfo;

/**
 * 挂号Controller
 *
 * @author yhp
 * @date 2024-07-08
 */
@RestController
@RequestMapping("/appointment/appointment")
public class AppointmentsController extends BaseController
{
    @Autowired
    private IAppointmentsService AppointmentsService;

    /**
     * 查询挂号列表
     */
    @PreAuthorize("@ss.hasPermi('cancel_appointment:cancel_appointment:list')")
    @GetMapping("/list")
    public TableDataInfo list(Appointments Appointments)
    {
        startPage();
        List<Appointments> list = AppointmentsService.selectAppointmentsList(Appointments);
        return getDataTable(list);
    }

    /**
     * 导出挂号列表
     */
    @PreAuthorize("@ss.hasPermi('cancel_appointment:cancel_appointment:export')")
    @Log(title = "挂号", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Appointments Appointments)
    {
        List<Appointments> list = AppointmentsService.selectAppointmentsList(Appointments);
        ExcelUtil<Appointments> util = new ExcelUtil<Appointments>(Appointments.class);
        util.exportExcel(response, list, "挂号数据");
    }

    /**
     * 获取挂号详细信息
     */
    @PreAuthorize("@ss.hasPermi('cancel_appointment:cancel_appointment:query')")
    @GetMapping(value = "/{appointmentId}")
    public AjaxResult getInfo(@PathVariable("appointmentId") Long appointmentId)
    {
        return success(AppointmentsService.selectAppointmentsByAppointmentId(appointmentId));
    }

    /**
     * 新增挂号
     */
    @Transactional
    @PreAuthorize("@ss.hasPermi('cancel_appointment:cancel_appointment:add')")
    @Log(title = "挂号", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Appointments Appointments)
    {
        AjaxResult result = toAjax(AppointmentsService.insertAppointments(Appointments));
        if (result.isSuccess()){
            AppointmentsService.insertCharges(Appointments);
            AppointmentsService.insertRefund(Appointments);
        }
        return result;
    }

    /**
     * 修改挂号
     */
    @PreAuthorize("@ss.hasPermi('cancel_appointment:cancel_appointment:edit')")
    @Log(title = "挂号", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Appointments Appointments)
    {
        return toAjax(AppointmentsService.updateAppointments(Appointments));
    }

    /**
     * 删除挂号
     */
    @PreAuthorize("@ss.hasPermi('cancel_appointment:cancel_appointment:remove')")
    @Log(title = "挂号", businessType = BusinessType.DELETE)
    @DeleteMapping("/{appointmentIds}")
    public AjaxResult remove(@PathVariable Long[] appointmentIds)
    {
        return toAjax(AppointmentsService.deleteAppointmentsByAppointmentIds(appointmentIds));
    }
}
