package com.ygt.requests.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ygt.common.annotation.Excel;
import com.ygt.common.core.domain.BaseEntity;

/**
 * 检查申请对象 examination_requests
 * 
 * @author ruoyi
 * @date 2024-07-11
 */
public class ExaminationRequests extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 申请ID */
    private Long requestId;

    /** 挂号ID */
    private Long appointmentId;

    /** 检查编码 */
    @Excel(name = "检查编码")
    private String examCode;

    /** 检查名称 */
    @Excel(name = "检查名称")
    private String examName;

    /** 单价 */
    @Excel(name = "单价")
    private BigDecimal unitPrice;

    /** 费用分类 */
    @Excel(name = "费用分类")
    private String feeCategory;

    /** 目的和要求 */
    private String purposeRequirements;

    /** 检查地点 */
    private String examLocation;

    /** 备注 */
    private String notes;

    public void setRequestId(Long requestId) 
    {
        this.requestId = requestId;
    }

    public Long getRequestId() 
    {
        return requestId;
    }
    public void setAppointmentId(Long appointmentId) 
    {
        this.appointmentId = appointmentId;
    }

    public Long getAppointmentId() 
    {
        return appointmentId;
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
    public void setFeeCategory(String feeCategory) 
    {
        this.feeCategory = feeCategory;
    }

    public String getFeeCategory() 
    {
        return feeCategory;
    }
    public void setPurposeRequirements(String purposeRequirements) 
    {
        this.purposeRequirements = purposeRequirements;
    }

    public String getPurposeRequirements() 
    {
        return purposeRequirements;
    }
    public void setExamLocation(String examLocation) 
    {
        this.examLocation = examLocation;
    }

    public String getExamLocation() 
    {
        return examLocation;
    }
    public void setNotes(String notes) 
    {
        this.notes = notes;
    }

    public String getNotes() 
    {
        return notes;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("requestId", getRequestId())
            .append("appointmentId", getAppointmentId())
            .append("examCode", getExamCode())
            .append("examName", getExamName())
            .append("unitPrice", getUnitPrice())
            .append("feeCategory", getFeeCategory())
            .append("purposeRequirements", getPurposeRequirements())
            .append("examLocation", getExamLocation())
            .append("notes", getNotes())
            .toString();
    }
}
