package com.ygt.refund.service;

import java.util.List;
import com.ygt.refund.domain.Refund;

/**
 * 收费Service接口
 * 
 * @author ruoyi
 * @date 2024-07-10
 */
public interface IRefundService 
{
    /**
     * 查询收费
     * 
     * @param chargeId 收费主键
     * @return 收费
     */
    public Refund selectRefundByChargeId(Long chargeId);

    /**
     * 查询收费列表
     * 
     * @param refund 收费
     * @return 收费集合
     */
    public List<Refund> selectRefundList(Refund refund);

    /**
     * 新增收费
     * 
     * @param refund 收费
     * @return 结果
     */
    public int insertRefund(Refund refund);

    /**
     * 修改收费
     * 
     * @param refund 收费
     * @return 结果
     */
    public int updateRefund(Refund refund);

    /**
     * 批量删除收费
     * 
     * @param chargeIds 需要删除的收费主键集合
     * @return 结果
     */
    public int deleteRefundByChargeIds(Long[] chargeIds);

    /**
     * 删除收费信息
     * 
     * @param chargeId 收费主键
     * @return 结果
     */
    public int deleteRefundByChargeId(Long chargeId);
}
