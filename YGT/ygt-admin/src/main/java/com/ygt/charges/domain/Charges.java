package com.ygt.charges.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ygt.appointment.domain.Appointments;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ygt.common.annotation.Excel;
import com.ygt.common.core.domain.BaseEntity;

/**
 * 收费对象 charges
 * 
 * @author yhp
 * @date 2024-07-10
 */
public class Charges extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 收费ID */
    private Long chargeId;

    /** 挂号ID */
    private Long appointmentId;

    /** 病历号 */
    private Long medicalRecordNumber;

    /** 患者姓名 */
    private String patientName;

    /** 身份证号 */
    private String idNumber;

    /** 患者年龄 */
    private Long age;

    /** 患者性别 */
    private String gender;

    /** 项目名称 */
    @Excel(name = "项目名称")
    private String itemName;

    /** 单价 */
    @Excel(name = "单价")
    private BigDecimal unitPrice;

    /** 类型 */
    @Excel(name = "类型")
    private String category;

    /** 规格 */
    @Excel(name = "规格")
    private String specification;

    /** 开立时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开立时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date issueDate;

    public void setChargeId(Long chargeId) 
    {
        this.chargeId = chargeId;
    }

    public Long getChargeId() 
    {
        return chargeId;
    }
    public void setAppointmentId(Long appointmentId) 
    {
        this.appointmentId = appointmentId;
    }

    public Long getAppointmentId() 
    {
        return appointmentId;
    }
    public void setMedicalRecordNumber(Long medicalRecordNumber) 
    {
        this.medicalRecordNumber = medicalRecordNumber;
    }

    public Long getMedicalRecordNumber() 
    {
        return medicalRecordNumber;
    }
    public void setPatientName(String patientName) 
    {
        this.patientName = patientName;
    }

    public String getPatientName() 
    {
        return patientName;
    }
    public void setIdNumber(String idNumber) 
    {
        this.idNumber = idNumber;
    }

    public String getIdNumber() 
    {
        return idNumber;
    }
    public void setAge(Long age) 
    {
        this.age = age;
    }

    public Long getAge() 
    {
        return age;
    }
    public void setGender(String gender) 
    {
        this.gender = gender;
    }

    public String getGender() 
    {
        return gender;
    }
    public void setItemName(String itemName) 
    {
        this.itemName = itemName;
    }

    public String getItemName() 
    {
        return itemName;
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
    public void setSpecification(String specification) 
    {
        this.specification = specification;
    }

    public String getSpecification() 
    {
        return specification;
    }
    public void setIssueDate(Date issueDate) 
    {
        this.issueDate = issueDate;
    }

    public Date getIssueDate() 
    {
        return issueDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("chargeId", getChargeId())
            .append("appointmentId", getAppointmentId())
            .append("medicalRecordNumber", getMedicalRecordNumber())
            .append("patientName", getPatientName())
            .append("idNumber", getIdNumber())
            .append("age", getAge())
            .append("gender", getGender())
            .append("itemName", getItemName())
            .append("unitPrice", getUnitPrice())
            .append("category", getCategory())
            .append("specification", getSpecification())
            .append("issueDate", getIssueDate())
            .toString();
    }
}
