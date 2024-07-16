package com.ygt.feeRecords.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ygt.feeRecords.mapper.FeeRecordsMapper;
import com.ygt.feeRecords.domain.FeeRecords;
import com.ygt.feeRecords.service.IFeeRecordsService;

/**
 * 收费Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-07-15
 */
@Service
public class FeeRecordsServiceImpl implements IFeeRecordsService 
{
    @Autowired
    private FeeRecordsMapper feeRecordsMapper;

    /**
     * 查询收费
     * 
     * @param chargeId 收费主键
     * @return 收费
     */
    @Override
    public FeeRecords selectFeeRecordsByChargeId(Long chargeId)
    {
        return feeRecordsMapper.selectFeeRecordsByChargeId(chargeId);
    }

    /**
     * 查询收费列表
     * 
     * @param feeRecords 收费
     * @return 收费
     */
    @Override
    public List<FeeRecords> selectFeeRecordsList(FeeRecords feeRecords)
    {
        return feeRecordsMapper.selectFeeRecordsList(feeRecords);
    }

    /**
     * 新增收费
     * 
     * @param feeRecords 收费
     * @return 结果
     */
    @Override
    public int insertFeeRecords(FeeRecords feeRecords)
    {
        return feeRecordsMapper.insertFeeRecords(feeRecords);
    }

    /**
     * 修改收费
     * 
     * @param feeRecords 收费
     * @return 结果
     */
    @Override
    public int updateFeeRecords(FeeRecords feeRecords)
    {
        return feeRecordsMapper.updateFeeRecords(feeRecords);
    }

    /**
     * 批量删除收费
     * 
     * @param chargeIds 需要删除的收费主键
     * @return 结果
     */
    @Override
    public int deleteFeeRecordsByChargeIds(Long[] chargeIds)
    {
        return feeRecordsMapper.deleteFeeRecordsByChargeIds(chargeIds);
    }

    /**
     * 删除收费信息
     * 
     * @param chargeId 收费主键
     * @return 结果
     */
    @Override
    public int deleteFeeRecordsByChargeId(Long chargeId)
    {
        return feeRecordsMapper.deleteFeeRecordsByChargeId(chargeId);
    }
}
