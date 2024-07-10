package com.ygt.refund.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ygt.refund.mapper.RefundMapper;
import com.ygt.refund.domain.Refund;
import com.ygt.refund.service.IRefundService;

/**
 * 收费Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-07-10
 */
@Service
public class RefundServiceImpl implements IRefundService 
{
    @Autowired
    private RefundMapper refundMapper;

    /**
     * 查询收费
     * 
     * @param chargeId 收费主键
     * @return 收费
     */
    @Override
    public Refund selectRefundByChargeId(Long chargeId)
    {
        return refundMapper.selectRefundByChargeId(chargeId);
    }

    /**
     * 查询收费列表
     * 
     * @param refund 收费
     * @return 收费
     */
    @Override
    public List<Refund> selectRefundList(Refund refund)
    {
        return refundMapper.selectRefundList(refund);
    }

    /**
     * 新增收费
     * 
     * @param refund 收费
     * @return 结果
     */
    @Override
    public int insertRefund(Refund refund)
    {
        return refundMapper.insertRefund(refund);
    }

    /**
     * 修改收费
     * 
     * @param refund 收费
     * @return 结果
     */
    @Override
    public int updateRefund(Refund refund)
    {
        return refundMapper.updateRefund(refund);
    }

    /**
     * 批量删除收费
     * 
     * @param chargeIds 需要删除的收费主键
     * @return 结果
     */
    @Override
    public int deleteRefundByChargeIds(Long[] chargeIds)
    {
        return refundMapper.deleteRefundByChargeIds(chargeIds);
    }

    /**
     * 删除收费信息
     * 
     * @param chargeId 收费主键
     * @return 结果
     */
    @Override
    public int deleteRefundByChargeId(Long chargeId)
    {
        return refundMapper.deleteRefundByChargeId(chargeId);
    }
}
