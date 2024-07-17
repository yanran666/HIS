package com.ygt.drug.controller;

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
import com.ygt.drug.domain.Drug;
import com.ygt.drug.service.IDrugService;
import com.ygt.common.utils.poi.ExcelUtil;
import com.ygt.common.core.page.TableDataInfo;

/**
 * 药品Controller
 * 
 * @author jzy
 * @date 2024-07-15
 */
@RestController
@RequestMapping("/drug/drug")
public class DrugController extends BaseController
{
    @Autowired
    private IDrugService drugService;

    /**
     * 查询药品列表
     */
    @PreAuthorize("@ss.hasPermi('drug:drug:list')")
    @GetMapping("/list")
    public TableDataInfo list(Drug drug)
    {
        startPage();
        List<Drug> list = drugService.selectDrugList(drug);
        return getDataTable(list);
    }

//    /**
//     * 导出药品列表
//     */
//    @PreAuthorize("@ss.hasPermi('drug:drug:export')")
//    @Log(title = "药品", businessType = BusinessType.EXPORT)
//    @PostMapping("/export")
//    public void export(HttpServletResponse response, Drug drug)
//    {
//        List<Drug> list = drugService.selectDrugList(drug);
//        ExcelUtil<Drug> util = new ExcelUtil<Drug>(Drug.class);
//        util.exportExcel(response, list, "药品数据");
//    }

    /**
     * 获取药品详细信息
     */
    @PreAuthorize("@ss.hasPermi('drug:drug:query')")
    @GetMapping(value = "/{drugId}")
    public AjaxResult getInfo(@PathVariable("drugId") Long drugId)
    {
        return success(drugService.selectDrugByDrugId(drugId));
    }

    /**
     * 新增药品
     */
    @PreAuthorize("@ss.hasPermi('drug:drug:add')")
    @Log(title = "药品", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Drug drug)
    {
        return toAjax(drugService.insertDrug(drug));
    }

    /**
     * 修改药品
     */
    @PreAuthorize("@ss.hasPermi('drug:drug:edit')")
    @Log(title = "药品", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Drug drug)
    {
        return toAjax(drugService.updateDrug(drug));
    }

    /**
     * 删除药品
     */
    @PreAuthorize("@ss.hasPermi('drug:drug:remove')")
    @Log(title = "药品", businessType = BusinessType.DELETE)
	@DeleteMapping("/{drugIds}")
    public AjaxResult remove(@PathVariable Long[] drugIds)
    {
        return toAjax(drugService.deleteDrugByDrugIds(drugIds));
    }
}
