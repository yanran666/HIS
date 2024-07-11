package com.ygt.examination.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ygt.common.annotation.Excel;
import com.ygt.common.core.domain.BaseEntity;

/**
 * 检查对象 examination
 * 
 * @author ruoyi
 * @date 2024-07-11
 */
public class Examination extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 检查ID（主键） */
    private Long examId;

    /** 检查编码 */
    @Excel(name = "检查编码")
    private String examCode;

    /** 检查名称 */
    @Excel(name = "检查名称")
    private String examName;

    /** 单价 */
    @Excel(name = "单价")
    private BigDecimal unitPrice;

    /** 类型 */
    @Excel(name = "类型")
    private String category;

    public void setExamId(Long examId) 
    {
        this.examId = examId;
    }

    public Long getExamId() 
    {
        return examId;
    }
    public void setExamCode(String examCode) 
    {
        this.examCode = examCode;
    }

    public String getExamCode() 
    {
        return examCode;
    }
    public void setExamName(String examName) 
    {
        this.examName = examName;
    }

    public String getExamName() 
    {
        return examName;
    }
    public void setUnitPrice(BigDecimal unitPrice) 
    {
        this.unitPrice = unitPrice;
    }

    public BigDecimal getUnitPrice() 
    {
        return unitPrice;
    }
    public void setCategory(String category) 
    {
        this.category = category;
    }

    public String getCategory() 
    {
        return category;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("examId", getExamId())
            .append("examCode", getExamCode())
            .append("examName", getExamName())
            .append("unitPrice", getUnitPrice())
            .append("category", getCategory())
            .toString();
    }
}
