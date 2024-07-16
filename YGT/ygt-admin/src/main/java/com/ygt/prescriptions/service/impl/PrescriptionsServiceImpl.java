package com.ygt.prescriptions.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ygt.prescriptions.mapper.PrescriptionsMapper;
import com.ygt.prescriptions.domain.Prescriptions;
import com.ygt.prescriptions.service.IPrescriptionsService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 处方Service业务层处理
 * 
 * @author jzy
 * @date 2024-07-13
 */
@Service
public class PrescriptionsServiceImpl implements IPrescriptionsService 
{
    @Autowired
    private PrescriptionsMapper prescriptionsMapper;

    /**
     * 查询处方
     * 
     * @param prescriptionId 处方主键
     * @return 处方
     */
    @Override
    public Prescriptions selectPrescriptionsByPrescriptionId(Long prescriptionId)
    {
        return prescriptionsMapper.selectPrescriptionsByPrescriptionId(prescriptionId);
    }

    /**
     * 查询处方列表
     * 
     * @param prescriptions 处方
     * @return 处方
     */
    @Override
    public List<Prescriptions> selectPrescriptionsList(Prescriptions prescriptions)
    {
        return prescriptionsMapper.selectPrescriptionsList(prescriptions);
    }

    /**
     * 新增处方
     * 
     * @param prescriptions 处方
     * @return 结果
     */
    @Override
    @Transactional
    public int insertPrescriptions(Prescriptions prescriptions)
    {
        return prescriptionsMapper.insertPrescriptions(prescriptions);
    }

    /**
     * 新增处方到收费
     *
     * @param prescriptions 处方
     * @return 结果
     */
    @Override
    @Transactional
    public int insertChargesFromPrescriptionAndAppointment(Prescriptions prescriptions)
    {
        return prescriptionsMapper.insertChargesFromPrescriptionAndAppointment(prescriptions);
    }
    /**
     * 新增处方到收费
     *
     * @param prescriptions 处方
     * @return 结果
     */
    @Override
    @Transactional
    public int insertRefundFromPrescriptionAndAppointment(Prescriptions prescriptions)
    {
        return prescriptionsMapper.insertRefundFromPrescriptionAndAppointment(prescriptions);
    }

    /**
     * 新增处方到收费
     *
     * @param prescriptions 处方
     * @return 结果
     */
    @Override
    @Transactional
    public int insertFeeRecordsFromPrescriptionAndAppointment(Prescriptions prescriptions)
    {
        return prescriptionsMapper.insertFeeRecordsFromPrescriptionAndAppointment(prescriptions);
    }

    /**
     * 修改处方
     * 
     * @param prescriptions 处方
     * @return 结果
     */
    @Override
    public int updatePrescriptions(Prescriptions prescriptions)
    {
        return prescriptionsMapper.updatePrescriptions(prescriptions);
    }

    /**
     * 批量删除处方
     * 
     * @param prescriptionIds 需要删除的处方主键
     * @return 结果
     */
    @Override
    public int deletePrescriptionsByPrescriptionIds(Long[] prescriptionIds)
    {
        return prescriptionsMapper.deletePrescriptionsByPrescriptionIds(prescriptionIds);
    }

    /**
     * 删除处方信息
     * 
     * @param prescriptionId 处方主键
     * @return 结果
     */
    @Override
    public int deletePrescriptionsByPrescriptionId(Long prescriptionId)
    {
        return prescriptionsMapper.deletePrescriptionsByPrescriptionId(prescriptionId);
    }
}
