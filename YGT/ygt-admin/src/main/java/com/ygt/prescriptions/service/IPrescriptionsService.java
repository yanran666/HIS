package com.ygt.prescriptions.service;

import java.util.List;
import com.ygt.prescriptions.domain.Prescriptions;

/**
 * 处方Service接口
 * 
 * @author jzy
 * @date 2024-07-13
 */
public interface IPrescriptionsService 
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
     * 新增处方到收费
     *
     * @param prescriptions 处方
     * @return 结果
     */
    public int insertChargesFromPrescriptionAndAppointment(Prescriptions prescriptions);

    /**
     * 新增处方到退费
     *
     * @param prescriptions 处方
     * @return 结果
     */
    public int insertRefundFromPrescriptionAndAppointment(Prescriptions prescriptions);

    /**
     * 新增处方到收费记录
     *
     * @param prescriptions 处方
     * @return 结果
     */
    public int insertFeeRecordsFromPrescriptionAndAppointment(Prescriptions prescriptions);
    /**
     * 修改处方
     * 
     * @param prescriptions 处方
     * @return 结果
     */
    public int updatePrescriptions(Prescriptions prescriptions);

    /**
     * 批量删除处方
     * 
     * @param prescriptionIds 需要删除的处方主键集合
     * @return 结果
     */
    public int deletePrescriptionsByPrescriptionIds(Long[] prescriptionIds);

    /**
     * 删除处方信息
     * 
     * @param prescriptionId 处方主键
     * @return 结果
     */
    public int deletePrescriptionsByPrescriptionId(Long prescriptionId);
}
