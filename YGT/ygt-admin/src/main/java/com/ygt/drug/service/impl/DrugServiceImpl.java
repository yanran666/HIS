package com.ygt.drug.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ygt.drug.mapper.DrugMapper;
import com.ygt.drug.domain.Drug;
import com.ygt.drug.service.IDrugService;

/**
 * 药品Service业务层处理
 * 
 * @author jzy
 * @date 2024-07-15
 */
@Service
public class DrugServiceImpl implements IDrugService 
{
    @Autowired
    private DrugMapper drugMapper;

    /**
     * 查询药品
     * 
     * @param drugId 药品主键
     * @return 药品
     */
    @Override
    public Drug selectDrugByDrugId(Long drugId)
    {
        return drugMapper.selectDrugByDrugId(drugId);
    }

    /**
     * 查询药品列表
     * 
     * @param drug 药品
     * @return 药品
     */
    @Override
    public List<Drug> selectDrugList(Drug drug)
    {
        return drugMapper.selectDrugList(drug);
    }

    /**
     * 新增药品
     * 
     * @param drug 药品
     * @return 结果
     */
    @Override
    public int insertDrug(Drug drug)
    {
        return drugMapper.insertDrug(drug);
    }

    /**
     * 修改药品
     * 
     * @param drug 药品
     * @return 结果
     */
    @Override
    public int updateDrug(Drug drug)
    {
        return drugMapper.updateDrug(drug);
    }

    /**
     * 批量删除药品
     * 
     * @param drugIds 需要删除的药品主键
     * @return 结果
     */
    @Override
    public int deleteDrugByDrugIds(Long[] drugIds)
    {
        return drugMapper.deleteDrugByDrugIds(drugIds);
    }

    /**
     * 删除药品信息
     * 
     * @param drugId 药品主键
     * @return 结果
     */
    @Override
    public int deleteDrugByDrugId(Long drugId)
    {
        return drugMapper.deleteDrugByDrugId(drugId);
    }
}
