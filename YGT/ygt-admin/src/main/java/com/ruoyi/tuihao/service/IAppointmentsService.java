package com.ruoyi.tuihao.service;

import java.util.List;
import com.ruoyi.tuihao.domain.Appointments;

/**
 * 窗口退号Service接口
 * 
 * @author jzy
 * @date 2024-07-04
 */
public interface IAppointmentsService 
{
    /**
     * 查询窗口退号
     * 
     * @param appointmentId 窗口退号主键
     * @return 窗口退号
     */
    public Appointments selectAppointmentsByAppointmentId(Long appointmentId);

    /**
     * 查询窗口退号列表
     * 
     * @param appointments 窗口退号
     * @return 窗口退号集合
     */
    public List<Appointments> selectAppointmentsList(Appointments appointments);

    /**
     * 新增窗口退号
     * 
     * @param appointments 窗口退号
     * @return 结果
     */
    public int insertAppointments(Appointments appointments);

    /**
     * 修改窗口退号
     * 
     * @param appointments 窗口退号
     * @return 结果
     */
    public int updateAppointments(Appointments appointments);

    /**
     * 批量删除窗口退号
     * 
     * @param appointmentIds 需要删除的窗口退号主键集合
     * @return 结果
     */
    public int deleteAppointmentsByAppointmentIds(Long[] appointmentIds);

    /**
     * 删除窗口退号信息
     * 
     * @param appointmentId 窗口退号主键
     * @return 结果
     */
    public int deleteAppointmentsByAppointmentId(Long appointmentId);
}
