package com.ygt.medicalCheck.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ygt.medicalCheck.mapper.medicalCheckMapper;
import com.ygt.medicalCheck.domain.medicalCheck;
import com.ygt.medicalCheck.service.ImedicalCheckService;

/**
 * 病历记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-07-17
 */
@Service
public class medicalCheckServiceImpl implements ImedicalCheckService 
{
    @Autowired
    private medicalCheckMapper medicalCheckMapper;

    /**
     * 查询病历记录
     * 
     * @param medicalRecordId 病历记录主键
     * @return 病历记录
     */
    @Override
    public medicalCheck selectmedicalCheckByMedicalRecordId(Long medicalRecordId)
    {
        return medicalCheckMapper.selectmedicalCheckByMedicalRecordId(medicalRecordId);
    }

    /**
     * 查询病历记录列表
     * 
     * @param medicalCheck 病历记录
     * @return 病历记录
     */
    @Override
    public List<medicalCheck> selectmedicalCheckList(medicalCheck medicalCheck)
    {
        return medicalCheckMapper.selectmedicalCheckList(medicalCheck);
    }

    /**
     * 新增病历记录
     * 
     * @param medicalCheck 病历记录
     * @return 结果
     */
    @Override
    public int insertmedicalCheck(medicalCheck medicalCheck)
    {
        return medicalCheckMapper.insertmedicalCheck(medicalCheck);
    }

    /**
     * 修改病历记录
     * 
     * @param medicalCheck 病历记录
     * @return 结果
     */
    @Override
    public int updatemedicalCheck(medicalCheck medicalCheck)
    {
        return medicalCheckMapper.updatemedicalCheck(medicalCheck);
    }

    /**
     * 批量删除病历记录
     * 
     * @param medicalRecordIds 需要删除的病历记录主键
     * @return 结果
     */
    @Override
    public int deletemedicalCheckByMedicalRecordIds(Long[] medicalRecordIds)
    {
        return medicalCheckMapper.deletemedicalCheckByMedicalRecordIds(medicalRecordIds);
    }

    /**
     * 删除病历记录信息
     * 
     * @param medicalRecordId 病历记录主键
     * @return 结果
     */
    @Override
    public int deletemedicalCheckByMedicalRecordId(Long medicalRecordId)
    {
        return medicalCheckMapper.deletemedicalCheckByMedicalRecordId(medicalRecordId);
    }
}
