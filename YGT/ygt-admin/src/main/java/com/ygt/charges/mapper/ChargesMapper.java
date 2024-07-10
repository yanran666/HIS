package com.ygt.charges.mapper;

import java.util.List;
import com.ygt.charges.domain.Charges;

/**
 * 收费Mapper接口
 * 
 * @author yhp
 * @date 2024-07-10
 */
public interface ChargesMapper 
{
    /**
     * 查询收费
     * 
     * @param chargeId 收费主键
     * @return 收费
     */
    public Charges selectChargesByChargeId(Long chargeId);

    /**
     * 查询收费列表
     * 
     * @param charges 收费
     * @return 收费集合
     */
    public List<Charges> selectChargesList(Charges charges);

    /**
     * 新增收费
     * 
     * @param charges 收费
     * @return 结果
     */
    public int insertCharges(Charges charges);

    /**
     * 修改收费
     * 
     * @param charges 收费
     * @return 结果
     */
    public int updateCharges(Charges charges);

    /**
     * 删除收费
     * 
     * @param chargeId 收费主键
     * @return 结果
     */
    public int deleteChargesByChargeId(Long chargeId);

    /**
     * 批量删除收费
     * 
     * @param chargeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteChargesByChargeIds(Long[] chargeIds);
}
