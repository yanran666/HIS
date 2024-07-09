package com.ygt.patient.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ygt.common.annotation.Excel;
import com.ygt.common.core.domain.BaseEntity;

/**
 * 患者查看对象 appointments
 * 
 * @author jzy
 * @date 2024-07-09
 */
public class patientCheck extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 挂号ID */
    private Long appointmentId;

    /** 医生ID */
    private Long doctorId;

    /** 病历号 */
    @Excel(name = "病历号")
    private String medicalRecordNumber;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 性别 */
    private String gender;

    /** 年龄 */
    private Long age;

    /** 出生日期 */
    private Date dob;

    /** 身份证号码 */
    private String idNumber;

    /** 住址 */
    private String address;

    /** 结算类型 */
    private String settlementType;

    /** 就诊日期 */
    private Date clinicDate;

    /** 就诊时段 */
    private String session;

    /** 就诊科室 */
    private String department;

    /** 挂号类型 */
    private String registrationType;

    /** 就诊医生 */
    private String attendingDoctor;

    /** 初始号额 */
    private Long initialQuota;

    /** 已用号额 */
    private Long usedQuota;

    /** 病历状态 */
    private String medicalRecordStatus;

    /** 应收金额 */
    private BigDecimal receivableAmount;

    /** 收费方式 */
    private String paymentMethod;

    public void setAppointmentId(Long appointmentId) 
    {
        this.appointmentId = appointmentId;
    }

    public Long getAppointmentId() 
    {
        return appointmentId;
    }
    public void setDoctorId(Long doctorId) 
    {
        this.doctorId = doctorId;
    }

    public Long getDoctorId() 
    {
        return doctorId;
    }
    public void setMedicalRecordNumber(String medicalRecordNumber) 
    {
        this.medicalRecordNumber = medicalRecordNumber;
    }

    public String getMedicalRecordNumber() 
    {
        return medicalRecordNumber;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setGender(String gender) 
    {
        this.gender = gender;
    }

    public String getGender() 
    {
        return gender;
    }
    public void setAge(Long age) 
    {
        this.age = age;
    }

    public Long getAge() 
    {
        return age;
    }
    public void setDob(Date dob) 
    {
        this.dob = dob;
    }

    public Date getDob() 
    {
        return dob;
    }
    public void setIdNumber(String idNumber) 
    {
        this.idNumber = idNumber;
    }

    public String getIdNumber() 
    {
        return idNumber;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }
    public void setSettlementType(String settlementType) 
    {
        this.settlementType = settlementType;
    }

    public String getSettlementType() 
    {
        return settlementType;
    }
    public void setClinicDate(Date clinicDate) 
    {
        this.clinicDate = clinicDate;
    }

    public Date getClinicDate() 
    {
        return clinicDate;
    }
    public void setSession(String session) 
    {
        this.session = session;
    }

    public String getSession() 
    {
        return session;
    }
    public void setDepartment(String department) 
    {
        this.department = department;
    }

    public String getDepartment() 
    {
        return department;
    }
    public void setRegistrationType(String registrationType) 
    {
        this.registrationType = registrationType;
    }

    public String getRegistrationType() 
    {
        return registrationType;
    }
    public void setAttendingDoctor(String attendingDoctor) 
    {
        this.attendingDoctor = attendingDoctor;
    }

    public String getAttendingDoctor() 
    {
        return attendingDoctor;
    }
    public void setInitialQuota(Long initialQuota) 
    {
        this.initialQuota = initialQuota;
    }

    public Long getInitialQuota() 
    {
        return initialQuota;
    }
    public void setUsedQuota(Long usedQuota) 
    {
        this.usedQuota = usedQuota;
    }

    public Long getUsedQuota() 
    {
        return usedQuota;
    }
    public void setMedicalRecordStatus(String medicalRecordStatus) 
    {
        this.medicalRecordStatus = medicalRecordStatus;
    }

    public String getMedicalRecordStatus() 
    {
        return medicalRecordStatus;
    }
    public void setReceivableAmount(BigDecimal receivableAmount) 
    {
        this.receivableAmount = receivableAmount;
    }

    public BigDecimal getReceivableAmount() 
    {
        return receivableAmount;
    }
    public void setPaymentMethod(String paymentMethod) 
    {
        this.paymentMethod = paymentMethod;
    }

    public String getPaymentMethod() 
    {
        return paymentMethod;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("appointmentId", getAppointmentId())
            .append("doctorId", getDoctorId())
            .append("medicalRecordNumber", getMedicalRecordNumber())
            .append("name", getName())
            .append("gender", getGender())
            .append("age", getAge())
            .append("dob", getDob())
            .append("idNumber", getIdNumber())
            .append("address", getAddress())
            .append("settlementType", getSettlementType())
            .append("clinicDate", getClinicDate())
            .append("session", getSession())
            .append("department", getDepartment())
            .append("registrationType", getRegistrationType())
            .append("attendingDoctor", getAttendingDoctor())
            .append("initialQuota", getInitialQuota())
            .append("usedQuota", getUsedQuota())
            .append("medicalRecordStatus", getMedicalRecordStatus())
            .append("receivableAmount", getReceivableAmount())
            .append("paymentMethod", getPaymentMethod())
            .toString();
    }
}
