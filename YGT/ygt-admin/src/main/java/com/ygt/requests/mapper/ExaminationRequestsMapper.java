package com.ygt.requests.mapper;

import java.util.List;

import com.ygt.appointment.domain.Appointments;
import com.ygt.charges.domain.Charges;
import com.ygt.requests.domain.ExaminationRequests;

/**
 * 检查申请Mapper接口
 * 
 * @author ruoyi
 * @date 2024-07-11
 */
public interface ExaminationRequestsMapper 
{
    /**
     * 查询检查申请
     * 
     * @param requestId 检查申请主键
     * @return 检查申请
     */
    public ExaminationRequests selectExaminationRequestsByRequestId(Long requestId);

    /**
     * 查询挂号
     *
     * @param appointmentId 检查申请主键
     * @return 检查申请
     */
    public Appointments selectDataFromAppointmentsByAppointmentId(Long appointmentId);

    /**
     * 查询检查申请列表
     * 
     * @param examinationRequests 检查申请
     * @return 检查申请集合
     */
    public List<ExaminationRequests> selectExaminationRequestsList(ExaminationRequests examinationRequests);

    /**
     * 新增检查申请
     * 
     * @param examinationRequests 检查申请
     * @return 结果
     */
    public int insertExaminationRequests(ExaminationRequests examinationRequests);

    /**
     * 新增收费
     *
     * @param examinationRequests 检查申请
     * @return 结果
     */
    public int insertChargesFromExaminationAndAppointment(ExaminationRequests examinationRequests);

    /**
     * 新增退费
     *
     * @param examinationRequests 检查申请
     * @return 结果
     */
    public int insertRefundFromExaminationAndAppointment(ExaminationRequests examinationRequests);

    /**
     * 修改检查申请
     * 
     * @param examinationRequests 检查申请
     * @return 结果
     */
    public int updateExaminationRequests(ExaminationRequests examinationRequests);

    /**
     * 删除检查申请
     * 
     * @param requestId 检查申请主键
     * @return 结果
     */
    public int deleteExaminationRequestsByRequestId(Long requestId);

    /**
     * 批量删除检查申请
     * 
     * @param requestIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteExaminationRequestsByRequestIds(Long[] requestIds);
}
