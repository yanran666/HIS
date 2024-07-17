package com.ygt.medicalCheck.mapper;

import java.util.List;
import com.ygt.medicalCheck.domain.medicalCheck;

/**
 * 病历记录Mapper接口
 * 
 * @author ruoyi
 * @date 2024-07-17
 */
public interface medicalCheckMapper 
{
    /**
     * 查询病历记录
     * 
     * @param medicalRecordId 病历记录主键
     * @return 病历记录
     */
    public medicalCheck selectmedicalCheckByMedicalRecordId(Long medicalRecordId);

    /**
     * 查询病历记录列表
     * 
     * @param medicalCheck 病历记录
     * @return 病历记录集合
     */
    public List<medicalCheck> selectmedicalCheckList(medicalCheck medicalCheck);

    /**
     * 新增病历记录
     * 
     * @param medicalCheck 病历记录
     * @return 结果
     */
    public int insertmedicalCheck(medicalCheck medicalCheck);

    /**
     * 修改病历记录
     * 
     * @param medicalCheck 病历记录
     * @return 结果
     */
    public int updatemedicalCheck(medicalCheck medicalCheck);

    /**
     * 删除病历记录
     * 
     * @param medicalRecordId 病历记录主键
     * @return 结果
     */
    public int deletemedicalCheckByMedicalRecordId(Long medicalRecordId);

    /**
     * 批量删除病历记录
     * 
     * @param medicalRecordIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletemedicalCheckByMedicalRecordIds(Long[] medicalRecordIds);
}
