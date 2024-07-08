package com.ygt.appointment.service;


import java.util.List;
import com.ygt.appointment.domain.Appointments;

/**
 * 退号Service接口
 *
 * @author yhp
 * @date 2024-07-08
 */
public interface IAppointmentsService
{
    /**
     * 查询退号
     *
     * @param appointmentId 退号主键
     * @return 退号
     */
    public Appointments selectAppointmentsByAppointmentId(Long appointmentId);

    /**
     * 查询退号列表
     *
     * @param Appointments 退号
     * @return 退号集合
     */
    public List<Appointments> selectAppointmentsList(Appointments Appointments);

    /**
     * 新增退号
     *
     * @param Appointments 退号
     * @return 结果
     */
    public int insertAppointments(Appointments Appointments);

    /**
     * 修改退号
     *
     * @param Appointments 退号
     * @return 结果
     */
    public int updateAppointments(Appointments Appointments);

    /**
     * 批量删除退号
     *
     * @param appointmentIds 需要删除的退号主键集合
     * @return 结果
     */
    public int deleteAppointmentsByAppointmentIds(Long[] appointmentIds);

    /**
     * 删除退号信息
     *
     * @param appointmentId 退号主键
     * @return 结果
     */
    public int deleteAppointmentsByAppointmentId(Long appointmentId);
}
