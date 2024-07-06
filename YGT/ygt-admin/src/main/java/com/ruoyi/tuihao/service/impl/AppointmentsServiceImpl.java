package com.ruoyi.tuihao.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.tuihao.mapper.AppointmentsMapper;
import com.ruoyi.tuihao.domain.Appointments;
import com.ruoyi.tuihao.service.IAppointmentsService;

/**
 * 窗口退号Service业务层处理
 * 
 * @author jzy
 * @date 2024-07-04
 */
@Service
public class AppointmentsServiceImpl implements IAppointmentsService 
{
    @Autowired
    private AppointmentsMapper appointmentsMapper;

    /**
     * 查询窗口退号
     * 
     * @param appointmentId 窗口退号主键
     * @return 窗口退号
     */
    @Override
    public Appointments selectAppointmentsByAppointmentId(Long appointmentId)
    {
        return appointmentsMapper.selectAppointmentsByAppointmentId(appointmentId);
    }

    /**
     * 查询窗口退号列表
     * 
     * @param appointments 窗口退号
     * @return 窗口退号
     */
    @Override
    public List<Appointments> selectAppointmentsList(Appointments appointments)
    {
        return appointmentsMapper.selectAppointmentsList(appointments);
    }

    /**
     * 新增窗口退号
     * 
     * @param appointments 窗口退号
     * @return 结果
     */
    @Override
    public int insertAppointments(Appointments appointments)
    {
        return appointmentsMapper.insertAppointments(appointments);
    }

    /**
     * 修改窗口退号
     * 
     * @param appointments 窗口退号
     * @return 结果
     */
    @Override
    public int updateAppointments(Appointments appointments)
    {
        return appointmentsMapper.updateAppointments(appointments);
    }

    /**
     * 批量删除窗口退号
     * 
     * @param appointmentIds 需要删除的窗口退号主键
     * @return 结果
     */
    @Override
    public int deleteAppointmentsByAppointmentIds(Long[] appointmentIds)
    {
        return appointmentsMapper.deleteAppointmentsByAppointmentIds(appointmentIds);
    }

    /**
     * 删除窗口退号信息
     * 
     * @param appointmentId 窗口退号主键
     * @return 结果
     */
    @Override
    public int deleteAppointmentsByAppointmentId(Long appointmentId)
    {
        return appointmentsMapper.deleteAppointmentsByAppointmentId(appointmentId);
    }
}
