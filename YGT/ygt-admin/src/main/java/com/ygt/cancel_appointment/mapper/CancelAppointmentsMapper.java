package com.ygt.cancel_appointment.mapper;

import java.util.List;
import com.ygt.cancel_appointment.domain.CancelAppointments;

/**
 * 退号Mapper接口
 * 
 * @author yhp
 * @date 2024-07-08
 */
public interface CancelAppointmentsMapper 
{
    /**
     * 查询退号
     * 
     * @param appointmentId 退号主键
     * @return 退号
     */
    public CancelAppointments selectCancelAppointmentsByAppointmentId(Long appointmentId);

    /**
     * 查询退号列表
     * 
     * @param cancelAppointments 退号
     * @return 退号集合
     */
    public List<CancelAppointments> selectCancelAppointmentsList(CancelAppointments cancelAppointments);

    /**
     * 新增退号
     * 
     * @param cancelAppointments 退号
     * @return 结果
     */
    public int insertCancelAppointments(CancelAppointments cancelAppointments);

    /**
     * 修改退号
     * 
     * @param cancelAppointments 退号
     * @return 结果
     */
    public int updateCancelAppointments(CancelAppointments cancelAppointments);

    /**
     * 删除退号
     * 
     * @param appointmentId 退号主键
     * @return 结果
     */
    public int deleteCancelAppointmentsByAppointmentId(Long appointmentId);

    /**
     * 批量删除退号
     * 
     * @param appointmentIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCancelAppointmentsByAppointmentIds(Long[] appointmentIds);
}
