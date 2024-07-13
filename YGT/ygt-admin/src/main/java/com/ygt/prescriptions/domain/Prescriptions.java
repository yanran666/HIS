package com.ygt.prescriptions.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ygt.common.annotation.Excel;
import com.ygt.common.core.domain.BaseEntity;

/**
 * 处方对象 prescriptions
 * 
 * @author jzy
 * @date 2024-07-13
 */
public class Prescriptions extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 处方ID */
    private Long prescriptionId;

    /** 挂号ID */
    private Long appointmentId;

    /** 药品名称 */
    @Excel(name = "药品名称")
    private String drugName;

    /** 药品规格 */
    @Excel(name = "药品规格")
    private String drugSpecification;

    /** 单价 */
    @Excel(name = "单价")
    private BigDecimal unitPrice;

    /** 用法 */
    @Excel(name = "用法")
    private String usage;

    /** 数量 */
    @Excel(name = "数量")
    private Long quantity;

    public void setPrescriptionId(Long prescriptionId) 
    {
        this.prescriptionId = prescriptionId;
    }

    public Long getPrescriptionId() 
    {
        return prescriptionId;
    }
    public void setAppointmentId(Long appointmentId) 
    {
        this.appointmentId = appointmentId;
    }

    public Long getAppointmentId() 
    {
        return appointmentId;
    }
    public void setDrugName(String drugName) 
    {
        this.drugName = drugName;
    }

    public String getDrugName() 
    {
        return drugName;
    }
    public void setDrugSpecification(String drugSpecification) 
    {
        this.drugSpecification = drugSpecification;
    }

    public String getDrugSpecification() 
    {
        return drugSpecification;
    }
    public void setUnitPrice(BigDecimal unitPrice) 
    {
        this.unitPrice = unitPrice;
    }

    public BigDecimal getUnitPrice() 
    {
        return unitPrice;
    }
    public void setUsage(String usage) 
    {
        this.usage = usage;
    }

    public String getUsage() 
    {
        return usage;
    }
    public void setQuantity(Long quantity) 
    {
        this.quantity = quantity;
    }

    public Long getQuantity() 
    {
        return quantity;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("prescriptionId", getPrescriptionId())
            .append("appointmentId", getAppointmentId())
            .append("drugName", getDrugName())
            .append("drugSpecification", getDrugSpecification())
            .append("unitPrice", getUnitPrice())
            .append("usage", getUsage())
            .append("quantity", getQuantity())
            .toString();
    }
}
