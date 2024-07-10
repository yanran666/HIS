package com.ygt.charges.controller;

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
import com.ygt.charges.domain.Charges;
import com.ygt.charges.service.IChargesService;
import com.ygt.common.utils.poi.ExcelUtil;
import com.ygt.common.core.page.TableDataInfo;

/**
 * 收费Controller
 * 
 * @author yhp
 * @date 2024-07-10
 */
@RestController
@RequestMapping("/charges/charges")
public class ChargesController extends BaseController
{
    @Autowired
    private IChargesService chargesService;

    /**
     * 查询收费列表
     */
    @PreAuthorize("@ss.hasPermi('charges:charges:list')")
    @GetMapping("/list")
    public TableDataInfo list(Charges charges)
    {
        startPage();
        List<Charges> list = chargesService.selectChargesList(charges);
        return getDataTable(list);
    }

    /**
     * 导出收费列表
     */
    @PreAuthorize("@ss.hasPermi('charges:charges:export')")
    @Log(title = "收费", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Charges charges)
    {
        List<Charges> list = chargesService.selectChargesList(charges);
        ExcelUtil<Charges> util = new ExcelUtil<Charges>(Charges.class);
        util.exportExcel(response, list, "收费数据");
    }

    /**
     * 获取收费详细信息
     */
    @PreAuthorize("@ss.hasPermi('charges:charges:query')")
    @GetMapping(value = "/{chargeId}")
    public AjaxResult getInfo(@PathVariable("chargeId") Long chargeId)
    {
        return success(chargesService.selectChargesByChargeId(chargeId));
    }

    /**
     * 新增收费
     */
    @PreAuthorize("@ss.hasPermi('charges:charges:add')")
    @Log(title = "收费", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Charges charges)
    {
        return toAjax(chargesService.insertCharges(charges));
    }

    /**
     * 修改收费
     */
    @PreAuthorize("@ss.hasPermi('charges:charges:edit')")
    @Log(title = "收费", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Charges charges)
    {
        return toAjax(chargesService.updateCharges(charges));
    }

    /**
     * 删除收费
     */
    @PreAuthorize("@ss.hasPermi('charges:charges:remove')")
    @Log(title = "收费", businessType = BusinessType.DELETE)
	@DeleteMapping("/{chargeIds}")
    public AjaxResult remove(@PathVariable Long[] chargeIds)
    {
        return toAjax(chargesService.deleteChargesByChargeIds(chargeIds));
    }
}
