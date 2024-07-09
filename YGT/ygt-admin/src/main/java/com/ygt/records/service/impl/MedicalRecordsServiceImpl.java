package com.ygt.records.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ygt.records.mapper.MedicalRecordsMapper;
import com.ygt.records.domain.MedicalRecords;
import com.ygt.records.service.IMedicalRecordsService;

/**
 * 病历Service业务层处理
 * 
 * @author yhp
 * @date 2024-07-09
 */
@Service
public class MedicalRecordsServiceImpl implements IMedicalRecordsService 
{
    @Autowired
    private MedicalRecordsMapper medicalRecordsMapper;

    /**
     * 查询病历
     * 
     * @param medicalRecordId 病历主键
     * @return 病历
     */
    @Override
    public MedicalRecords selectMedicalRecordsByMedicalRecordId(Long medicalRecordId)
    {
        return medicalRecordsMapper.selectMedicalRecordsByMedicalRecordId(medicalRecordId);
    }

    /**
     * 查询病历列表
     * 
     * @param medicalRecords 病历
     * @return 病历
     */
    @Override
    public List<MedicalRecords> selectMedicalRecordsList(MedicalRecords medicalRecords)
    {
        return medicalRecordsMapper.selectMedicalRecordsList(medicalRecords);
    }

    /**
     * 新增病历
     * 
     * @param medicalRecords 病历
     * @return 结果
     */
    @Override
    public int insertMedicalRecords(MedicalRecords medicalRecords)
    {
        return medicalRecordsMapper.insertMedicalRecords(medicalRecords);
    }

    /**
     * 修改病历
     * 
     * @param medicalRecords 病历
     * @return 结果
     */
    @Override
    public int updateMedicalRecords(MedicalRecords medicalRecords)
    {
        return medicalRecordsMapper.updateMedicalRecords(medicalRecords);
    }

    /**
     * 批量删除病历
     * 
     * @param medicalRecordIds 需要删除的病历主键
     * @return 结果
     */
    @Override
    public int deleteMedicalRecordsByMedicalRecordIds(Long[] medicalRecordIds)
    {
        return medicalRecordsMapper.deleteMedicalRecordsByMedicalRecordIds(medicalRecordIds);
    }

    /**
     * 删除病历信息
     * 
     * @param medicalRecordId 病历主键
     * @return 结果
     */
    @Override
    public int deleteMedicalRecordsByMedicalRecordId(Long medicalRecordId)
    {
        return medicalRecordsMapper.deleteMedicalRecordsByMedicalRecordId(medicalRecordId);
    }
}
