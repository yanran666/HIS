package com.ygt.examination.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ygt.examination.mapper.ExaminationMapper;
import com.ygt.examination.domain.Examination;
import com.ygt.examination.service.IExaminationService;

/**
 * 检查Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-07-11
 */
@Service
public class ExaminationServiceImpl implements IExaminationService 
{
    @Autowired
    private ExaminationMapper examinationMapper;

    /**
     * 查询检查
     * 
     * @param examId 检查主键
     * @return 检查
     */
    @Override
    public Examination selectExaminationByExamId(Long examId)
    {
        return examinationMapper.selectExaminationByExamId(examId);
    }

    /**
     * 查询检查列表
     * 
     * @param examination 检查
     * @return 检查
     */
    @Override
    public List<Examination> selectExaminationList(Examination examination)
    {
        return examinationMapper.selectExaminationList(examination);
    }

    /**
     * 新增检查
     * 
     * @param examination 检查
     * @return 结果
     */
    @Override
    public int insertExamination(Examination examination)
    {
        return examinationMapper.insertExamination(examination);
    }

    /**
     * 修改检查
     * 
     * @param examination 检查
     * @return 结果
     */
    @Override
    public int updateExamination(Examination examination)
    {
        return examinationMapper.updateExamination(examination);
    }

    /**
     * 批量删除检查
     * 
     * @param examIds 需要删除的检查主键
     * @return 结果
     */
    @Override
    public int deleteExaminationByExamIds(Long[] examIds)
    {
        return examinationMapper.deleteExaminationByExamIds(examIds);
    }

    /**
     * 删除检查信息
     * 
     * @param examId 检查主键
     * @return 结果
     */
    @Override
    public int deleteExaminationByExamId(Long examId)
    {
        return examinationMapper.deleteExaminationByExamId(examId);
    }
}
