package com.ygt.records.mapper;

import java.util.List;
import com.ygt.records.domain.MedicalRecords;

/**
 * 病历Mapper接口
 * 
 * @author yhp
 * @date 2024-07-09
 */
public interface MedicalRecordsMapper 
{
    /**
     * 查询病历
     * 
     * @param medicalRecordId 病历主键
     * @return 病历
     */
    public MedicalRecords selectMedicalRecordsByMedicalRecordId(Long medicalRecordId);

    /**
     * 查询病历列表
     * 
     * @param medicalRecords 病历
     * @return 病历集合
     */
    public List<MedicalRecords> selectMedicalRecordsList(MedicalRecords medicalRecords);

    /**
     * 新增病历
     * 
     * @param medicalRecords 病历
     * @return 结果
     */
    public int insertMedicalRecords(MedicalRecords medicalRecords);

    /**
     * 修改病历
     * 
     * @param medicalRecords 病历
     * @return 结果
     */
    public int updateMedicalRecords(MedicalRecords medicalRecords);

    /**
     * 删除病历
     * 
     * @param medicalRecordId 病历主键
     * @return 结果
     */
    public int deleteMedicalRecordsByMedicalRecordId(Long medicalRecordId);

    /**
     * 批量删除病历
     * 
     * @param medicalRecordIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMedicalRecordsByMedicalRecordIds(Long[] medicalRecordIds);
}
