package com.ygt.requests.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ygt.requests.mapper.ExaminationRequestsMapper;
import com.ygt.requests.domain.ExaminationRequests;
import com.ygt.requests.service.IExaminationRequestsService;

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
    public int insertExaminationRequests(ExaminationRequests examinationRequests)
    {
        return examinationRequestsMapper.insertExaminationRequests(examinationRequests);
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
