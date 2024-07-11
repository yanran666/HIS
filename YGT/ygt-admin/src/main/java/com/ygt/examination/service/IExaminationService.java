package com.ygt.examination.service;

import java.util.List;
import com.ygt.examination.domain.Examination;

/**
 * 检查Service接口
 * 
 * @author ruoyi
 * @date 2024-07-11
 */
public interface IExaminationService 
{
    /**
     * 查询检查
     * 
     * @param examId 检查主键
     * @return 检查
     */
    public Examination selectExaminationByExamId(Long examId);

    /**
     * 查询检查列表
     * 
     * @param examination 检查
     * @return 检查集合
     */
    public List<Examination> selectExaminationList(Examination examination);

    /**
     * 新增检查
     * 
     * @param examination 检查
     * @return 结果
     */
    public int insertExamination(Examination examination);

    /**
     * 修改检查
     * 
     * @param examination 检查
     * @return 结果
     */
    public int updateExamination(Examination examination);

    /**
     * 批量删除检查
     * 
     * @param examIds 需要删除的检查主键集合
     * @return 结果
     */
    public int deleteExaminationByExamIds(Long[] examIds);

    /**
     * 删除检查信息
     * 
     * @param examId 检查主键
     * @return 结果
     */
    public int deleteExaminationByExamId(Long examId);
}
