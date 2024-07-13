package com.ygt.drug.service;

import java.util.List;
import com.ygt.drug.domain.Drug;

/**
 * 药品Service接口
 * 
 * @author jzy
 * @date 2024-07-13
 */
public interface IDrugService 
{
    /**
     * 查询药品
     * 
     * @param drugId 药品主键
     * @return 药品
     */
    public Drug selectDrugByDrugId(Long drugId);

    /**
     * 查询药品列表
     * 
     * @param drug 药品
     * @return 药品集合
     */
    public List<Drug> selectDrugList(Drug drug);

    /**
     * 新增药品
     * 
     * @param drug 药品
     * @return 结果
     */
    public int insertDrug(Drug drug);

    /**
     * 修改药品
     * 
     * @param drug 药品
     * @return 结果
     */
    public int updateDrug(Drug drug);

    /**
     * 批量删除药品
     * 
     * @param drugIds 需要删除的药品主键集合
     * @return 结果
     */
    public int deleteDrugByDrugIds(Long[] drugIds);

    /**
     * 删除药品信息
     * 
     * @param drugId 药品主键
     * @return 结果
     */
    public int deleteDrugByDrugId(Long drugId);
}
