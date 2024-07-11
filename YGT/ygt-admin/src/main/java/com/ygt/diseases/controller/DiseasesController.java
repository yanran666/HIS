package com.ygt.diseases.controller;

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
import com.ygt.diseases.domain.Diseases;
import com.ygt.diseases.service.IDiseasesService;
import com.ygt.common.utils.poi.ExcelUtil;
import com.ygt.common.core.page.TableDataInfo;

/**
 * 疾病Controller
 * 
 * @author ruoyi
 * @date 2024-07-10
 */
@RestController
@RequestMapping("/diseases/diseases")
public class DiseasesController extends BaseController
{
    @Autowired
    private IDiseasesService diseasesService;

    /**
     * 查询疾病列表
     */
    @PreAuthorize("@ss.hasPermi('diseases:diseases:list')")
    @GetMapping("/list")
    public TableDataInfo list(Diseases diseases)
    {
        startPage();
        List<Diseases> list = diseasesService.selectDiseasesList(diseases);
        return getDataTable(list);
    }

//    /**
//     * 导出疾病列表
//     */
//    @PreAuthorize("@ss.hasPermi('diseases:diseases:export')")
//    @Log(title = "疾病", businessType = BusinessType.EXPORT)
//    @PostMapping("/export")
//    public void export(HttpServletResponse response, Diseases diseases)
//    {
//        List<Diseases> list = diseasesService.selectDiseasesList(diseases);
//        ExcelUtil<Diseases> util = new ExcelUtil<Diseases>(Diseases.class);
//        util.exportExcel(response, list, "疾病数据");
//    }
//
//    /**
//     * 获取疾病详细信息
//     */
//    @PreAuthorize("@ss.hasPermi('diseases:diseases:query')")
//    @GetMapping(value = "/{diseaseId}")
//    public AjaxResult getInfo(@PathVariable("diseaseId") Long diseaseId)
//    {
//        return success(diseasesService.selectDiseasesByDiseaseId(diseaseId));
//    }
//
//    /**
//     * 新增疾病
//     */
//    @PreAuthorize("@ss.hasPermi('diseases:diseases:add')")
//    @Log(title = "疾病", businessType = BusinessType.INSERT)
//    @PostMapping
//    public AjaxResult add(@RequestBody Diseases diseases)
//    {
//        return toAjax(diseasesService.insertDiseases(diseases));
//    }
//
//    /**
//     * 修改疾病
//     */
//    @PreAuthorize("@ss.hasPermi('diseases:diseases:edit')")
//    @Log(title = "疾病", businessType = BusinessType.UPDATE)
//    @PutMapping
//    public AjaxResult edit(@RequestBody Diseases diseases)
//    {
//        return toAjax(diseasesService.updateDiseases(diseases));
//    }
//
//    /**
//     * 删除疾病
//     */
//    @PreAuthorize("@ss.hasPermi('diseases:diseases:remove')")
//    @Log(title = "疾病", businessType = BusinessType.DELETE)
//	@DeleteMapping("/{diseaseIds}")
//    public AjaxResult remove(@PathVariable Long[] diseaseIds)
//    {
//        return toAjax(diseasesService.deleteDiseasesByDiseaseIds(diseaseIds));
//    }
}
