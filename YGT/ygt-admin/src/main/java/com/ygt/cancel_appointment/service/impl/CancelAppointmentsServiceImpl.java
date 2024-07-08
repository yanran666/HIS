package com.ygt.cancel_appointment.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import com.ygt.cancel_appointment.mapper.CancelAppointmentsMapper;
import com.ygt.cancel_appointment.domain.CancelAppointments;
import com.ygt.cancel_appointment.service.ICancelAppointmentsService;

/**
 * 退号Service业务层处理
 * 
 * @author yhp
 * @date 2024-07-08
 */
@Service
public class CancelAppointmentsServiceImpl implements ICancelAppointmentsService 
{
    @Autowired
    private CancelAppointmentsMapper cancelAppointmentsMapper;

    /**
     * 查询退号
     * 
     * @param appointmentId 退号主键
     * @return 退号
     */
    @Override
    public CancelAppointments selectCancelAppointmentsByAppointmentId(Long appointmentId)
    {
        return cancelAppointmentsMapper.selectCancelAppointmentsByAppointmentId(appointmentId);
    }

    /**
     * 查询退号列表
     * 
     * @param cancelAppointments 退号
     * @return 退号
     */
    @Override
    public List<CancelAppointments> selectCancelAppointmentsList(CancelAppointments cancelAppointments)
    {
        return cancelAppointmentsMapper.selectCancelAppointmentsList(cancelAppointments);
    }

    /**
     * 新增退号
     * 
     * @param cancelAppointments 退号
     * @return 结果
     */
    @Override
    public int insertCancelAppointments(CancelAppointments cancelAppointments)
    {
        return cancelAppointmentsMapper.insertCancelAppointments(cancelAppointments);
    }

    /**
     * 修改退号
     * 
     * @param cancelAppointments 退号
     * @return 结果
     */
    @Override
    public int updateCancelAppointments(CancelAppointments cancelAppointments)
    {
        return cancelAppointmentsMapper.updateCancelAppointments(cancelAppointments);
    }

    /**
     * 批量删除退号
     * 
     * @param appointmentIds 需要删除的退号主键
     * @return 结果
     */
    @Override
    public int deleteCancelAppointmentsByAppointmentIds(Long[] appointmentIds)
    {
        return cancelAppointmentsMapper.deleteCancelAppointmentsByAppointmentIds(appointmentIds);
    }

    /**
     * 删除退号信息
     * 
     * @param appointmentId 退号主键
     * @return 结果
     */
    @Override
    public int deleteCancelAppointmentsByAppointmentId(Long appointmentId)
    {
        return cancelAppointmentsMapper.deleteCancelAppointmentsByAppointmentId(appointmentId);
    }
}
