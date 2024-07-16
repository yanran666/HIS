package com.ygt.requests.controller;

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
import com.ygt.requests.domain.ExaminationRequests;
import com.ygt.requests.service.IExaminationRequestsService;
import com.ygt.common.utils.poi.ExcelUtil;
import com.ygt.common.core.page.TableDataInfo;

/**
 * 检查申请Controller
 * 
 * @author ruoyi
 * @date 2024-07-11
 */
@RestController
@RequestMapping("/requests/requests")
public class ExaminationRequestsController extends BaseController
{
    @Autowired
    private IExaminationRequestsService examinationRequestsService;

    /**
     * 查询检查申请列表
     */
    @PreAuthorize("@ss.hasPermi('requests:requests:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExaminationRequests examinationRequests)
    {
        startPage();
        List<ExaminationRequests> list = examinationRequestsService.selectExaminationRequestsList(examinationRequests);
        return getDataTable(list);
    }

//    /**
//     * 导出检查申请列表
//     */
//    @PreAuthorize("@ss.hasPermi('requests:requests:export')")
//    @Log(title = "检查申请", businessType = BusinessType.EXPORT)
//    @PostMapping("/export")
//    public void export(HttpServletResponse response, ExaminationRequests examinationRequests)
//    {
//        List<ExaminationRequests> list = examinationRequestsService.selectExaminationRequestsList(examinationRequests);
//        ExcelUtil<ExaminationRequests> util = new ExcelUtil<ExaminationRequests>(ExaminationRequests.class);
//        util.exportExcel(response, list, "检查申请数据");
//    }

    /**
     * 获取检查申请详细信息
     */
    @PreAuthorize("@ss.hasPermi('requests:requests:query')")
    @GetMapping(value = "/{requestId}")
    public AjaxResult getInfo(@PathVariable("requestId") Long requestId)
    {
        return success(examinationRequestsService.selectExaminationRequestsByRequestId(requestId));
    }

    /**
     * 新增检查申请
     */
    @Transactional
    @PreAuthorize("@ss.hasPermi('requests:requests:add')")
    @Log(title = "检查申请", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExaminationRequests examinationRequests)
    {
        AjaxResult result = toAjax(examinationRequestsService.insertExaminationRequests(examinationRequests));
        if(result.isSuccess())
        {
            examinationRequestsService.insertChargesFromExaminationAndAppointment(examinationRequests);
            examinationRequestsService.insertRefundFromExaminationAndAppointment(examinationRequests);
            examinationRequestsService.insertFeeRecordsFromExaminationAndAppointment(examinationRequests);
        }
        return result;
    }

//    /**
//     * 修改检查申请
//     */
//    @PreAuthorize("@ss.hasPermi('requests:requests:edit')")
//    @Log(title = "检查申请", businessType = BusinessType.UPDATE)
//    @PutMapping
//    public AjaxResult edit(@RequestBody ExaminationRequests examinationRequests)
//    {
//        return toAjax(examinationRequestsService.updateExaminationRequests(examinationRequests));
//    }

//    /**
//     * 删除检查申请
//     */
//    @PreAuthorize("@ss.hasPermi('requests:requests:remove')")
//    @Log(title = "检查申请", businessType = BusinessType.DELETE)
//	@DeleteMapping("/{requestIds}")
//    public AjaxResult remove(@PathVariable Long[] requestIds)
//    {
//        return toAjax(examinationRequestsService.deleteExaminationRequestsByRequestIds(requestIds));
//    }
}
