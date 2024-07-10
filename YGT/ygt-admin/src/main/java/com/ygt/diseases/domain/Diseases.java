package com.ygt.diseases.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ygt.common.annotation.Excel;
import com.ygt.common.core.domain.BaseEntity;

/**
 * 疾病对象 diseases
 * 
 * @author ruoyi
 * @date 2024-07-10
 */
public class Diseases extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 疾病ID */
    private Long diseaseId;

    /** 疾病编码 */
    private String diseaseCode;

    /** 疾病名称 */
    @Excel(name = "疾病名称")
    private String diseaseName;

    /** 疾病ICD */
    @Excel(name = "疾病ICD")
    private String icdCode;

    /** 疾病类型 */
    @Excel(name = "疾病类型")
    private String diseaseType;

    public void setDiseaseId(Long diseaseId) 
    {
        this.diseaseId = diseaseId;
    }

    public Long getDiseaseId() 
    {
        return diseaseId;
    }
    public void setDiseaseCode(String diseaseCode) 
    {
        this.diseaseCode = diseaseCode;
    }

    public String getDiseaseCode() 
    {
        return diseaseCode;
    }
    public void setDiseaseName(String diseaseName) 
    {
        this.diseaseName = diseaseName;
    }

    public String getDiseaseName() 
    {
        return diseaseName;
    }
    public void setIcdCode(String icdCode) 
    {
        this.icdCode = icdCode;
    }

    public String getIcdCode() 
    {
        return icdCode;
    }
    public void setDiseaseType(String diseaseType) 
    {
        this.diseaseType = diseaseType;
    }

    public String getDiseaseType() 
    {
        return diseaseType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("diseaseId", getDiseaseId())
            .append("diseaseCode", getDiseaseCode())
            .append("diseaseName", getDiseaseName())
            .append("icdCode", getIcdCode())
            .append("diseaseType", getDiseaseType())
            .toString();
    }
}
