package com.ygt.refund.mapper;

import java.util.List;
import com.ygt.refund.domain.Refund;

/**
 * 收费Mapper接口
 * 
 * @author ruoyi
 * @date 2024-07-10
 */
public interface RefundMapper 
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
     * 删除收费
     * 
     * @param chargeId 收费主键
     * @return 结果
     */
    public int deleteRefundByChargeId(Long chargeId);

    /**
     * 批量删除收费
     * 
     * @param chargeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteRefundByChargeIds(Long[] chargeIds);
}
