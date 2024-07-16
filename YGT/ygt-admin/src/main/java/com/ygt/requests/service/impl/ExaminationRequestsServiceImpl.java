package com.ygt.requests.service.impl;

import java.util.List;

import com.ygt.appointment.domain.Appointments;
import com.ygt.charges.domain.Charges;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ygt.requests.mapper.ExaminationRequestsMapper;
import com.ygt.requests.domain.ExaminationRequests;
import com.ygt.requests.service.IExaminationRequestsService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 检查申请Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-07-11
 */
@Service
public class ExaminationRequestsServiceImpl implements IExaminationRequestsService 
{
    @Autowired
    private ExaminationRequestsMapper examinationRequestsMapper;

    /**
     * 查询检查申请
     * 
     * @param requestId 检查申请主键
     * @return 检查申请
     */
    @Override
    public ExaminationRequests selectExaminationRequestsByRequestId(Long requestId)
    {
        return examinationRequestsMapper.selectExaminationRequestsByRequestId(requestId);
    }

    /**
     * 查询挂号
     *
     * @param appointmentId 挂号主键
     * @return 检查申请
     */
    @Override
    public Appointments selectDataFromAppointmentsByAppointmentId(Long appointmentId)
    {
        return examinationRequestsMapper.selectDataFromAppointmentsByAppointmentId(appointmentId);
    }

    /**
     * 查询检查申请列表
     * 
     * @param examinationRequests 检查申请
     * @return 检查申请
     */
    @Override
    public List<ExaminationRequests> selectExaminationRequestsList(ExaminationRequests examinationRequests)
    {
        return examinationRequestsMapper.selectExaminationRequestsList(examinationRequests);
    }

    /**
     * 新增检查申请
     * 
     * @param examinationRequests 检查申请
     * @return 结果
     */
    @Override
    @Transactional
    public int insertExaminationRequests(ExaminationRequests examinationRequests)
    {
        return examinationRequestsMapper.insertExaminationRequests(examinationRequests);
    }
    /**
     * 导入收费表
     *
     * @param examinationRequests 检查申请
     * @return 结果
     */
    @Override
    @Transactional
    public int insertChargesFromExaminationAndAppointment(ExaminationRequests examinationRequests)
    {
        System.out.println("Inserting charges for examination and appointment...");
        return examinationRequestsMapper.insertChargesFromExaminationAndAppointment(examinationRequests);
    }

    /**
     * 导入退费表
     *
     * @param examinationRequests 检查申请
     * @return 结果
     */
    @Override
    @Transactional
    public int insertRefundFromExaminationAndAppointment(ExaminationRequests examinationRequests)
    {
        System.out.println("Inserting refund for examination and appointment...");
        return examinationRequestsMapper.insertRefundFromExaminationAndAppointment(examinationRequests);
    }

    /**
     * 导入收费记录
     *
     * @param examinationRequests 检查申请
     * @return 结果
     */
    @Override
    @Transactional
    public int insertFeeRecordsFromExaminationAndAppointment(ExaminationRequests examinationRequests)
    {
        System.out.println("Inserting fee_records for examination and appointment...");
        return examinationRequestsMapper.insertFeeRecordsFromExaminationAndAppointment(examinationRequests);
    }

    /**
     * 修改检查申请
     * 
     * @param examinationRequests 检查申请
     * @return 结果
     */
    @Override
    public int updateExaminationRequests(ExaminationRequests examinationRequests)
    {
        return examinationRequestsMapper.updateExaminationRequests(examinationRequests);
    }

    /**
     * 批量删除检查申请
     * 
     * @param requestIds 需要删除的检查申请主键
     * @return 结果
     */
    @Override
    public int deleteExaminationRequestsByRequestIds(Long[] requestIds)
    {
        return examinationRequestsMapper.deleteExaminationRequestsByRequestIds(requestIds);
    }

    /**
     * 删除检查申请信息
     * 
     * @param requestId 检查申请主键
     * @return 结果
     */
    @Override
    public int deleteExaminationRequestsByRequestId(Long requestId)
    {
        return examinationRequestsMapper.deleteExaminationRequestsByRequestId(requestId);
    }
}
