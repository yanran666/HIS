package com.ygt.appointment.service;


import java.util.List;
import com.ygt.appointment.domain.Appointments;

/**
 * 挂号Service接口
 *
 * @author yhp
 * @date 2024-07-08
 */
public interface IAppointmentsService
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
     * 新增收费
     *
     * @param Appointments 挂号
     * @return 结果
     */
    public int insertCharges(Appointments Appointments);
    /**
     * 新增退费
     *
     * @param Appointments 挂号
     * @return 结果
     */
    public int insertRefund(Appointments Appointments);
    /**
     * 修改挂号
     *
     * @param Appointments 挂号
     * @return 结果
     */
    public int updateAppointments(Appointments Appointments);

    /**
     * 批量删除挂号
     *
     * @param appointmentIds 需要删除的挂号主键集合
     * @return 结果
     */
    public int deleteAppointmentsByAppointmentIds(Long[] appointmentIds);

    /**
     * 删除挂号信息
     *
     * @param appointmentId 挂号主键
     * @return 结果
     */
    public int deleteAppointmentsByAppointmentId(Long appointmentId);
}
