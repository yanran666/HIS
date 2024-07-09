package com.ygt.patient.mapper;

import java.util.List;
import com.ygt.patient.domain.patientCheck;

/**
 * 患者查看Mapper接口
 * 
 * @author jzy
 * @date 2024-07-09
 */
public interface patientCheckMapper 
{
    /**
     * 查询患者查看
     * 
     * @param appointmentId 患者查看主键
     * @return 患者查看
     */
    public patientCheck selectpatientCheckByAppointmentId(Long appointmentId);

    /**
     * 查询患者查看列表
     * 
     * @param patientCheck 患者查看
     * @return 患者查看集合
     */
    public List<patientCheck> selectpatientCheckList(patientCheck patientCheck);

    /**
     * 新增患者查看
     * 
     * @param patientCheck 患者查看
     * @return 结果
     */
    public int insertpatientCheck(patientCheck patientCheck);

    /**
     * 修改患者查看
     * 
     * @param patientCheck 患者查看
     * @return 结果
     */
    public int updatepatientCheck(patientCheck patientCheck);

    /**
     * 删除患者查看
     * 
     * @param appointmentId 患者查看主键
     * @return 结果
     */
    public int deletepatientCheckByAppointmentId(Long appointmentId);

    /**
     * 批量删除患者查看
     * 
     * @param appointmentIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletepatientCheckByAppointmentIds(Long[] appointmentIds);
}
