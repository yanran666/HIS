package com.ygt.records.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ygt.common.annotation.Excel;
import com.ygt.common.core.domain.BaseEntity;

/**
 * 病历对象 medical_records
 * 
 * @author yhp
 * @date 2024-07-09
 */
public class MedicalRecords extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 病历ID（主键） */
    private Long medicalRecordId;

    /** 挂号ID（外键参考挂号表） */
    private Long appointmentId;

    /** 医生ID（外键参考医生表） */
    private Long doctorId;

    /** 疾病ID（外键参考疾病表） */
    private Long diseaseId;

    /** 就诊日期 */
    private Date clinicDate;

    /** 主诉 */
    private String chiefComplaint;

    /** 现病史 */
    private String presentIllnessHistory;

    /** 现病治疗情况 */
    private String treatmentHistory;

    /** 既往史 */
    private String pastHistory;

    /** 过敏史 */
    private String allergyHistory;

    /** 体格检查 */
    private String physicalExamination;

    /** 注意事项 */
    private String notes;

    /** 疾病编码 */
    private String diseaseCode;

    /** 疾病名称 */
    private String diseaseName;

    /** 国际ICD编码 */
    private String icdCode;

    /** 疾病类型 */
    private String diseaseType;

    public void setMedicalRecordId(Long medicalRecordId) 
    {
        this.medicalRecordId = medicalRecordId;
    }

    public Long getMedicalRecordId() 
    {
        return medicalRecordId;
    }
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
    public void setDiseaseId(Long diseaseId) 
    {
        this.diseaseId = diseaseId;
    }

    public Long getDiseaseId() 
    {
        return diseaseId;
    }
    public void setClinicDate(Date clinicDate) 
    {
        this.clinicDate = clinicDate;
    }

    public Date getClinicDate() 
    {
        return clinicDate;
    }
    public void setChiefComplaint(String chiefComplaint) 
    {
        this.chiefComplaint = chiefComplaint;
    }

    public String getChiefComplaint() 
    {
        return chiefComplaint;
    }
    public void setPresentIllnessHistory(String presentIllnessHistory) 
    {
        this.presentIllnessHistory = presentIllnessHistory;
    }

    public String getPresentIllnessHistory() 
    {
        return presentIllnessHistory;
    }
    public void setTreatmentHistory(String treatmentHistory) 
    {
        this.treatmentHistory = treatmentHistory;
    }

    public String getTreatmentHistory() 
    {
        return treatmentHistory;
    }
    public void setPastHistory(String pastHistory) 
    {
        this.pastHistory = pastHistory;
    }

    public String getPastHistory() 
    {
        return pastHistory;
    }
    public void setAllergyHistory(String allergyHistory) 
    {
        this.allergyHistory = allergyHistory;
    }

    public String getAllergyHistory() 
    {
        return allergyHistory;
    }
    public void setPhysicalExamination(String physicalExamination) 
    {
        this.physicalExamination = physicalExamination;
    }

    public String getPhysicalExamination() 
    {
        return physicalExamination;
    }
    public void setNotes(String notes) 
    {
        this.notes = notes;
    }

    public String getNotes() 
    {
        return notes;
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
            .append("medicalRecordId", getMedicalRecordId())
            .append("appointmentId", getAppointmentId())
            .append("doctorId", getDoctorId())
            .append("diseaseId", getDiseaseId())
            .append("clinicDate", getClinicDate())
            .append("chiefComplaint", getChiefComplaint())
            .append("presentIllnessHistory", getPresentIllnessHistory())
            .append("treatmentHistory", getTreatmentHistory())
            .append("pastHistory", getPastHistory())
            .append("allergyHistory", getAllergyHistory())
            .append("physicalExamination", getPhysicalExamination())
            .append("notes", getNotes())
            .append("diseaseCode", getDiseaseCode())
            .append("diseaseName", getDiseaseName())
            .append("icdCode", getIcdCode())
            .append("diseaseType", getDiseaseType())
            .toString();
    }
}
