package com.ygt.appointment.mapper;

import com.ygt.appointment.domain.Appointments;

import java.util.List;

/**
 * 挂号Mapper接口
 * 
 * @author yhp
 * @date 2024-07-08
 */
public interface AppointmentsMapper 
{
    /**
     * 查询挂号
     * 
     * @param appointmentId 挂号主键
     * @return 挂号
     */
    public Appointments selectAppointmentsByAppointmentId(Long appointmentId);

    /**
     * 查询挂号列表
     * 
     * @param Appointments 挂号
     * @return 挂号集合
     */
    public List<Appointments> selectAppointmentsList(Appointments Appointments);

    /**
     * 新增挂号
     * 
     * @param Appointments 挂号
     * @return 结果
     */
    public int insertAppointments(Appointments Appointments);

    /**
     * 修改挂号
     * 
     * @param Appointments 挂号
     * @return 结果
     */
    public int updateAppointments(Appointments Appointments);

    /**
     * 删除挂号
     * 
     * @param appointmentId 挂号主键
     * @return 结果
     */
    public int deleteAppointmentsByAppointmentId(Long appointmentId);

    /**
     * 批量删除挂号
     * 
     * @param appointmentIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAppointmentsByAppointmentIds(Long[] appointmentIds);
}
