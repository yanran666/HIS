package com.ygt.diseases.service;

import java.util.List;
import com.ygt.diseases.domain.Diseases;

/**
 * 疾病Service接口
 * 
 * @author ruoyi
 * @date 2024-07-10
 */
public interface IDiseasesService 
{
    /**
     * 查询疾病
     * 
     * @param diseaseId 疾病主键
     * @return 疾病
     */
    public Diseases selectDiseasesByDiseaseId(Long diseaseId);

    /**
     * 查询疾病列表
     * 
     * @param diseases 疾病
     * @return 疾病集合
     */
    public List<Diseases> selectDiseasesList(Diseases diseases);

    /**
     * 新增疾病
     * 
     * @param diseases 疾病
     * @return 结果
     */
    public int insertDiseases(Diseases diseases);

    /**
     * 修改疾病
     * 
     * @param diseases 疾病
     * @return 结果
     */
    public int updateDiseases(Diseases diseases);

    /**
     * 批量删除疾病
     * 
     * @param diseaseIds 需要删除的疾病主键集合
     * @return 结果
     */
    public int deleteDiseasesByDiseaseIds(Long[] diseaseIds);

    /**
     * 删除疾病信息
     * 
     * @param diseaseId 疾病主键
     * @return 结果
     */
    public int deleteDiseasesByDiseaseId(Long diseaseId);
}
