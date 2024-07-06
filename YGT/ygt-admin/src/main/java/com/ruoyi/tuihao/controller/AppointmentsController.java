package com.ruoyi.tuihao.controller;

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
import com.ruoyi.tuihao.domain.Appointments;
import com.ruoyi.tuihao.service.IAppointmentsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 窗口退号Controller
 * 
 * @author jzy
 * @date 2024-07-04
 */
@RestController
@RequestMapping("/tuihao/tuihao")
public class AppointmentsController extends BaseController
{
    @Autowired
    private IAppointmentsService appointmentsService;

    /**
     * 查询窗口退号列表
     */
    @PreAuthorize("@ss.hasPermi('tuihao:tuihao:list')")
    @GetMapping("/list")
    public TableDataInfo list(Appointments appointments)
    {
        startPage();
        List<Appointments> list = appointmentsService.selectAppointmentsList(appointments);
        return getDataTable(list);
    }

    /**
     * 导出窗口退号列表
     */
    @PreAuthorize("@ss.hasPermi('tuihao:tuihao:export')")
    @Log(title = "窗口退号", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Appointments appointments)
    {
        List<Appointments> list = appointmentsService.selectAppointmentsList(appointments);
        ExcelUtil<Appointments> util = new ExcelUtil<Appointments>(Appointments.class);
        util.exportExcel(response, list, "窗口退号数据");
    }

    /**
     * 获取窗口退号详细信息
     */
    @PreAuthorize("@ss.hasPermi('tuihao:tuihao:query')")
    @GetMapping(value = "/{appointmentId}")
    public AjaxResult getInfo(@PathVariable("appointmentId") Long appointmentId)
    {
        return success(appointmentsService.selectAppointmentsByAppointmentId(appointmentId));
    }

    /**
     * 新增窗口退号
     */
    @PreAuthorize("@ss.hasPermi('tuihao:tuihao:add')")
    @Log(title = "窗口退号", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Appointments appointments)
    {
        return toAjax(appointmentsService.insertAppointments(appointments));
    }

    /**
     * 修改窗口退号
     */
    @PreAuthorize("@ss.hasPermi('tuihao:tuihao:edit')")
    @Log(title = "窗口退号", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Appointments appointments)
    {
        return toAjax(appointmentsService.updateAppointments(appointments));
    }

    /**
     * 删除窗口退号
     */
    @PreAuthorize("@ss.hasPermi('tuihao:tuihao:remove')")
    @Log(title = "窗口退号", businessType = BusinessType.DELETE)
	@DeleteMapping("/{appointmentIds}")
    public AjaxResult remove(@PathVariable Long[] appointmentIds)
    {
        return toAjax(appointmentsService.deleteAppointmentsByAppointmentIds(appointmentIds));
    }
}
