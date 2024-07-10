package com.ygt.diseases.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ygt.diseases.mapper.DiseasesMapper;
import com.ygt.diseases.domain.Diseases;
import com.ygt.diseases.service.IDiseasesService;

/**
 * 疾病Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-07-10
 */
@Service
public class DiseasesServiceImpl implements IDiseasesService 
{
    @Autowired
    private DiseasesMapper diseasesMapper;

    /**
     * 查询疾病
     * 
     * @param diseaseId 疾病主键
     * @return 疾病
     */
    @Override
    public Diseases selectDiseasesByDiseaseId(Long diseaseId)
    {
        return diseasesMapper.selectDiseasesByDiseaseId(diseaseId);
    }

    /**
     * 查询疾病列表
     * 
     * @param diseases 疾病
     * @return 疾病
     */
    @Override
    public List<Diseases> selectDiseasesList(Diseases diseases)
    {
        return diseasesMapper.selectDiseasesList(diseases);
    }

    /**
     * 新增疾病
     * 
     * @param diseases 疾病
     * @return 结果
     */
    @Override
    public int insertDiseases(Diseases diseases)
    {
        return diseasesMapper.insertDiseases(diseases);
    }

    /**
     * 修改疾病
     * 
     * @param diseases 疾病
     * @return 结果
     */
    @Override
    public int updateDiseases(Diseases diseases)
    {
        return diseasesMapper.updateDiseases(diseases);
    }

    /**
     * 批量删除疾病
     * 
     * @param diseaseIds 需要删除的疾病主键
     * @return 结果
     */
    @Override
    public int deleteDiseasesByDiseaseIds(Long[] diseaseIds)
    {
        return diseasesMapper.deleteDiseasesByDiseaseIds(diseaseIds);
    }

    /**
     * 删除疾病信息
     * 
     * @param diseaseId 疾病主键
     * @return 结果
     */
    @Override
    public int deleteDiseasesByDiseaseId(Long diseaseId)
    {
        return diseasesMapper.deleteDiseasesByDiseaseId(diseaseId);
    }
}
