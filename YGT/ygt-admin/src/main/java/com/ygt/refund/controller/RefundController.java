package com.ygt.refund.controller;

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
import com.ygt.refund.domain.Refund;
import com.ygt.refund.service.IRefundService;
import com.ygt.common.utils.poi.ExcelUtil;
import com.ygt.common.core.page.TableDataInfo;

/**
 * 退费Controller
 * 
 * @author ruoyi
 * @date 2024-07-10
 */
@RestController
@RequestMapping("/refund/refund")
public class RefundController extends BaseController
{
    @Autowired
    private IRefundService refundService;

    /**
     * 查询退费列表
     */
    @PreAuthorize("@ss.hasPermi('refund:refund:list')")
    @GetMapping("/list")
    public TableDataInfo list(Refund refund)
    {
        startPage();
        List<Refund> list = refundService.selectRefundList(refund);
        return getDataTable(list);
    }

//    /**
//     * 导出退费列表
//     */
//    @PreAuthorize("@ss.hasPermi('refund:refund:export')")
//    @Log(title = "退费", businessType = BusinessType.EXPORT)
//    @PostMapping("/export")
//    public void export(HttpServletResponse response, Refund refund)
//    {
//        List<Refund> list = refundService.selectRefundList(refund);
//        ExcelUtil<Refund> util = new ExcelUtil<Refund>(Refund.class);
//        util.exportExcel(response, list, "退费数据");
//    }
//
//    /**
//     * 获取退费详细信息
//     */
//    @PreAuthorize("@ss.hasPermi('refund:refund:query')")
//    @GetMapping(value = "/{chargeId}")
//    public AjaxResult getInfo(@PathVariable("chargeId") Long chargeId)
//    {
//        return success(refundService.selectRefundByChargeId(chargeId));
//    }
//
//    /**
//     * 新增退费
//     */
//    @PreAuthorize("@ss.hasPermi('refund:refund:add')")
//    @Log(title = "退费", businessType = BusinessType.INSERT)
//    @PostMapping
//    public AjaxResult add(@RequestBody Refund refund)
//    {
//        return toAjax(refundService.insertRefund(refund));
//    }
//
//    /**
//     * 修改退费
//     */
//    @PreAuthorize("@ss.hasPermi('refund:refund:edit')")
//    @Log(title = "退费", businessType = BusinessType.UPDATE)
//    @PutMapping
//    public AjaxResult edit(@RequestBody Refund refund)
//    {
//        return toAjax(refundService.updateRefund(refund));
//    }

    /**
     * 删除退费
     */
    @PreAuthorize("@ss.hasPermi('refund:refund:remove')")
    @Log(title = "退费", businessType = BusinessType.DELETE)
	@DeleteMapping("/{chargeIds}")
    public AjaxResult remove(@PathVariable Long[] chargeIds)
    {
        return toAjax(refundService.deleteRefundByChargeIds(chargeIds));
    }
}
