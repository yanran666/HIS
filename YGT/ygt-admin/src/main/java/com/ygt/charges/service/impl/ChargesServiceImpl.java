package com.ygt.charges.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ygt.charges.mapper.ChargesMapper;
import com.ygt.charges.domain.Charges;
import com.ygt.charges.service.IChargesService;

/**
 * 收费Service业务层处理
 * 
 * @author yhp
 * @date 2024-07-10
 */
@Service
public class ChargesServiceImpl implements IChargesService 
{
    @Autowired
    private ChargesMapper chargesMapper;

    /**
     * 查询收费
     * 
     * @param chargeId 收费主键
     * @return 收费
     */
    @Override
    public Charges selectChargesByChargeId(Long chargeId)
    {
        return chargesMapper.selectChargesByChargeId(chargeId);
    }

    /**
     * 查询收费列表
     * 
     * @param charges 收费
     * @return 收费
     */
    @Override
    public List<Charges> selectChargesList(Charges charges)
    {
        return chargesMapper.selectChargesList(charges);
    }

    /**
     * 新增收费
     * 
     * @param charges 收费
     * @return 结果
     */
    @Override
    public int insertCharges(Charges charges)
    {
        return chargesMapper.insertCharges(charges);
    }

    /**
     * 修改收费
     * 
     * @param charges 收费
     * @return 结果
     */
    @Override
    public int updateCharges(Charges charges)
    {
        return chargesMapper.updateCharges(charges);
    }

    /**
     * 批量删除收费
     * 
     * @param chargeIds 需要删除的收费主键
     * @return 结果
     */
    @Override
    public int deleteChargesByChargeIds(Long[] chargeIds)
    {
        return chargesMapper.deleteChargesByChargeIds(chargeIds);
    }

    /**
     * 删除收费信息
     * 
     * @param chargeId 收费主键
     * @return 结果
     */
    @Override
    public int deleteChargesByChargeId(Long chargeId)
    {
        return chargesMapper.deleteChargesByChargeId(chargeId);
    }
}
