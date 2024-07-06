package com.ruoyi.tuihao.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 窗口退号对象 appointments
 * 
 * @author jzy
 * @date 2024-07-04
 */
public class Appointments extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 挂号id */
    private Long appointmentId;

    /** 病人id */
    private Long patientId;

    /** 医生id */
    private Long doctorId;

    /** 病历号 */
    @Excel(name = "病历号")
    private String medicalRecordNumber;

    /** 患者姓名 */
    @Excel(name = "患者姓名")
    private String name;

    /** 性别 */
    @Excel(name = "性别")
    private String gender;

    /** $column.columnComment */
    private Long age;

    /** $column.columnComment */
    private Date dob;

    /** 身份证号 */
    @Excel(name = "身份证号")
    private String idNumber;

    /** $column.columnComment */
    private String address;

    /** 付款方式 */
    @Excel(name = "付款方式")
    private String settlementType;

    /** $column.columnComment */
    private Date clinicDate;

    /** $column.columnComment */
    private String session;

    /** $column.columnComment */
    private String department;

    /** $column.columnComment */
    private String registrationType;

    /** $column.columnComment */
    private String attendingDoctor;

    /** $column.columnComment */
    private Long initialQuota;

    /** $column.columnComment */
    private Long usedQuota;

    /** $column.columnComment */
    private String medicalRecordStatus;

    /** $column.columnComment */
    private BigDecimal receivableAmount;

    /** $column.columnComment */
    private String paymentMethod;

    public void setAppointmentId(Long appointmentId) 
    {
        this.appointmentId = appointmentId;
    }

    public Long getAppointmentId() 
    {
        return appointmentId;
    }
    public void setPatientId(Long patientId) 
    {
        this.patientId = patientId;
    }

    public Long getPatientId() 
    {
        return patientId;
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
            .append("patientId", getPatientId())
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
