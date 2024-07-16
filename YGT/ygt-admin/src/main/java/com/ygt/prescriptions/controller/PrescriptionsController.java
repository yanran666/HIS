package com.ygt.prescriptions.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.ygt.prescriptions.domain.Prescriptions;
import com.ygt.prescriptions.service.IPrescriptionsService;
import com.ygt.common.utils.poi.ExcelUtil;
import com.ygt.common.core.page.TableDataInfo;

/**
 * 处方Controller
 * 
 * @author jzy
 * @date 2024-07-13
 */
@RestController
@RequestMapping("/prescriptions/prescriptions")
public class PrescriptionsController extends BaseController
{
    @Autowired
    private IPrescriptionsService prescriptionsService;

    /**
     * 查询处方列表
     */
    @PreAuthorize("@ss.hasPermi('prescriptions:prescriptions:list')")
    @GetMapping("/list")
    public TableDataInfo list(Prescriptions prescriptions)
    {
        startPage();
        List<Prescriptions> list = prescriptionsService.selectPrescriptionsList(prescriptions);
        return getDataTable(list);
    }

//    /**
//     * 导出处方列表
//     */
//    @PreAuthorize("@ss.hasPermi('prescriptions:prescriptions:export')")
//    @Log(title = "处方", businessType = BusinessType.EXPORT)
//    @PostMapping("/export")
//    public void export(HttpServletResponse response, Prescriptions prescriptions)
//    {
//        List<Prescriptions> list = prescriptionsService.selectPrescriptionsList(prescriptions);
//        ExcelUtil<Prescriptions> util = new ExcelUtil<Prescriptions>(Prescriptions.class);
//        util.exportExcel(response, list, "处方数据");
//    }

    /**
     * 获取处方详细信息
     */
    @PreAuthorize("@ss.hasPermi('prescriptions:prescriptions:query')")
    @GetMapping(value = "/{prescriptionId}")
    public AjaxResult getInfo(@PathVariable("prescriptionId") Long prescriptionId)
    {
        return success(prescriptionsService.selectPrescriptionsByPrescriptionId(prescriptionId));
    }

    /**
     * 新增处方
     */
    @PreAuthorize("@ss.hasPermi('prescriptions:prescriptions:add')")
    @Log(title = "处方", businessType = BusinessType.INSERT)
    @PostMapping
    @Transactional
    public AjaxResult add(@RequestBody Prescriptions prescriptions)
    {
        AjaxResult result = toAjax(prescriptionsService.insertPrescriptions(prescriptions));
        if(result.isSuccess()){
            prescriptionsService.insertChargesFromPrescriptionAndAppointment(prescriptions);
            prescriptionsService.insertRefundFromPrescriptionAndAppointment(prescriptions);
            prescriptionsService.insertFeeRecordsFromPrescriptionAndAppointment(prescriptions);
        }
        return result;
    }

    /**
     * 修改处方
     */
    @PreAuthorize("@ss.hasPermi('prescriptions:prescriptions:edit')")
    @Log(title = "处方", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Prescriptions prescriptions)
    {
        return toAjax(prescriptionsService.updatePrescriptions(prescriptions));
    }

    /**
     * 删除处方
     */
    @PreAuthorize("@ss.hasPermi('prescriptions:prescriptions:remove')")
    @Log(title = "处方", businessType = BusinessType.DELETE)
	@DeleteMapping("/{prescriptionIds}")
    public AjaxResult remove(@PathVariable Long[] prescriptionIds)
    {
        return toAjax(prescriptionsService.deletePrescriptionsByPrescriptionIds(prescriptionIds));
    }
}
