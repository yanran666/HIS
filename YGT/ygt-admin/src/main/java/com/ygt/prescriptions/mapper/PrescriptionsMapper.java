package com.ygt.prescriptions.mapper;

import java.util.List;
import com.ygt.prescriptions.domain.Prescriptions;

/**
 * 处方Mapper接口
 * 
 * @author jzy
 * @date 2024-07-13
 */
public interface PrescriptionsMapper 
{
    /**
     * 查询处方
     * 
     * @param prescriptionId 处方主键
     * @return 处方
     */
    public Prescriptions selectPrescriptionsByPrescriptionId(Long prescriptionId);

    /**
     * 查询处方列表
     * 
     * @param prescriptions 处方
     * @return 处方集合
     */
    public List<Prescriptions> selectPrescriptionsList(Prescriptions prescriptions);

    /**
     * 新增处方
     * 
     * @param prescriptions 处方
     * @return 结果
     */
    public int insertPrescriptions(Prescriptions prescriptions);

    /**
     * 修改处方
     * 
     * @param prescriptions 处方
     * @return 结果
     */
    public int updatePrescriptions(Prescriptions prescriptions);

    /**
     * 删除处方
     * 
     * @param prescriptionId 处方主键
     * @return 结果
     */
    public int deletePrescriptionsByPrescriptionId(Long prescriptionId);

    /**
     * 批量删除处方
     * 
     * @param prescriptionIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePrescriptionsByPrescriptionIds(Long[] prescriptionIds);
}
