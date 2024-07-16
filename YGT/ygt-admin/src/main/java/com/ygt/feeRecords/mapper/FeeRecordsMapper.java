package com.ygt.feeRecords.mapper;

import java.util.List;
import com.ygt.feeRecords.domain.FeeRecords;

/**
 * 收费Mapper接口
 * 
 * @author ruoyi
 * @date 2024-07-15
 */
public interface FeeRecordsMapper 
{
    /**
     * 查询收费
     * 
     * @param chargeId 收费主键
     * @return 收费
     */
    public FeeRecords selectFeeRecordsByChargeId(Long chargeId);

    /**
     * 查询收费列表
     * 
     * @param feeRecords 收费
     * @return 收费集合
     */
    public List<FeeRecords> selectFeeRecordsList(FeeRecords feeRecords);

    /**
     * 新增收费
     * 
     * @param feeRecords 收费
     * @return 结果
     */
    public int insertFeeRecords(FeeRecords feeRecords);

    /**
     * 修改收费
     * 
     * @param feeRecords 收费
     * @return 结果
     */
    public int updateFeeRecords(FeeRecords feeRecords);

    /**
     * 删除收费
     * 
     * @param chargeId 收费主键
     * @return 结果
     */
    public int deleteFeeRecordsByChargeId(Long chargeId);

    /**
     * 批量删除收费
     * 
     * @param chargeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFeeRecordsByChargeIds(Long[] chargeIds);
}
