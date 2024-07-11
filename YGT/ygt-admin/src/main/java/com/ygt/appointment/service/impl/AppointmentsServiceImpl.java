package com.ygt.appointment.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import com.ygt.appointment.mapper.AppointmentsMapper;
import com.ygt.appointment.domain.Appointments;
import com.ygt.appointment.service.IAppointmentsService;

/**
 * 挂号Service业务层处理
 *
 * @author yhp
 * @date 2024-07-08
 */
@Service
public class AppointmentsServiceImpl implements IAppointmentsService
{
    @Autowired
    private AppointmentsMapper AppointmentsMapper;

    /**
     * 查询挂号
     *
     * @param appointmentId 挂号主键
     * @return 挂号
     */
    @Override
    public Appointments selectAppointmentsByAppointmentId(Long appointmentId)
    {
        return AppointmentsMapper.selectAppointmentsByAppointmentId(appointmentId);
    }

    /**
     * 查询挂号列表
     *
     * @param Appointments 挂号
     * @return 挂号
     */
    @Override
    public List<Appointments> selectAppointmentsList(Appointments Appointments)
    {
        return AppointmentsMapper.selectAppointmentsList(Appointments);
    }

    /**
     * 新增挂号
     *
     * @param Appointments 挂号
     * @return 结果
     */
    @Override
    public int insertAppointments(Appointments Appointments)
    {
        return AppointmentsMapper.insertAppointments(Appointments);
    }
    /**
     * 新增收费
     *
     * @param Appointments 挂号
     * @return 结果
     */
    @Override
    public int insertCharges(Appointments Appointments)
    {
        return AppointmentsMapper.insertCharges(Appointments);
    }
    /**
     * 新增退费
     *
     * @param Appointments 挂号
     * @return 结果
     */
    @Override
    public int insertRefund(Appointments Appointments)
    {
        return AppointmentsMapper.insertRefund(Appointments);
    }
    /**
     * 修改挂号
     *
     * @param Appointments 挂号
     * @return 结果
     */
    @Override
    public int updateAppointments(Appointments Appointments)
    {
        return AppointmentsMapper.updateAppointments(Appointments);
    }

    /**
     * 批量删除挂号
     *
     * @param appointmentIds 需要删除的挂号主键
     * @return 结果
     */
    @Override
    public int deleteAppointmentsByAppointmentIds(Long[] appointmentIds)
    {
        return AppointmentsMapper.deleteAppointmentsByAppointmentIds(appointmentIds);
    }

    /**
     * 删除挂号信息
     *
     * @param appointmentId 挂号主键
     * @return 结果
     */
    @Override
    public int deleteAppointmentsByAppointmentId(Long appointmentId)
    {
        return AppointmentsMapper.deleteAppointmentsByAppointmentId(appointmentId);
    }
}
