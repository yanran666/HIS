package com.ygt.patient.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ygt.patient.mapper.patientCheckMapper;
import com.ygt.patient.domain.patientCheck;
import com.ygt.patient.service.IpatientCheckService;

/**
 * 患者查看Service业务层处理
 * 
 * @author jzy
 * @date 2024-07-09
 */
@Service
public class patientCheckServiceImpl implements IpatientCheckService 
{
    @Autowired
    private patientCheckMapper patientCheckMapper;

    /**
     * 查询患者查看
     * 
     * @param appointmentId 患者查看主键
     * @return 患者查看
     */
    @Override
    public patientCheck selectpatientCheckByAppointmentId(Long appointmentId)
    {
        return patientCheckMapper.selectpatientCheckByAppointmentId(appointmentId);
    }

    /**
     * 查询患者查看列表
     * 
     * @param patientCheck 患者查看
     * @return 患者查看
     */
    @Override
    public List<patientCheck> selectpatientCheckList(patientCheck patientCheck)
    {
        return patientCheckMapper.selectpatientCheckList(patientCheck);
    }

    /**
     * 新增患者查看
     * 
     * @param patientCheck 患者查看
     * @return 结果
     */
    @Override
    public int insertpatientCheck(patientCheck patientCheck)
    {
        return patientCheckMapper.insertpatientCheck(patientCheck);
    }

    /**
     * 修改患者查看
     * 
     * @param patientCheck 患者查看
     * @return 结果
     */
    @Override
    public int updatepatientCheck(patientCheck patientCheck)
    {
        return patientCheckMapper.updatepatientCheck(patientCheck);
    }

    /**
     * 批量删除患者查看
     * 
     * @param appointmentIds 需要删除的患者查看主键
     * @return 结果
     */
    @Override
    public int deletepatientCheckByAppointmentIds(Long[] appointmentIds)
    {
        return patientCheckMapper.deletepatientCheckByAppointmentIds(appointmentIds);
    }

    /**
     * 删除患者查看信息
     * 
     * @param appointmentId 患者查看主键
     * @return 结果
     */
    @Override
    public int deletepatientCheckByAppointmentId(Long appointmentId)
    {
        return patientCheckMapper.deletepatientCheckByAppointmentId(appointmentId);
    }
}
