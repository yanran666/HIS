package com.ygt.drug.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ygt.common.annotation.Excel;
import com.ygt.common.core.domain.BaseEntity;

/**
 * 药品对象 drug
 * 
 * @author jzy
 * @date 2024-07-15
 */
public class Drug extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 药品ID */
    private Long drugId;

    /** 药品编码 */
    @Excel(name = "药品编码")
    private String drugCode;

    /** 药品名称 */
    @Excel(name = "药品名称")
    private String drugName;

    /** 药品规格 */
    @Excel(name = "药品规格")
    private String drugSpecification;

    /** 包装单位 */
    @Excel(name = "包装单位")
    private String packagingUnit;

    /** 生产厂家 */
    @Excel(name = "生产厂家")
    private String manufacturer;

    /** 单价 */
    @Excel(name = "单价")
    private BigDecimal unitPrice;

    /** 用法 */
    @Excel(name = "用法")
    private String usage;

    public void setDrugId(Long drugId) 
    {
        this.drugId = drugId;
    }

    public Long getDrugId() 
    {
        return drugId;
    }
    public void setDrugCode(String drugCode) 
    {
        this.drugCode = drugCode;
    }

    public String getDrugCode() 
    {
        return drugCode;
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
    public void setPackagingUnit(String packagingUnit) 
    {
        this.packagingUnit = packagingUnit;
    }

    public String getPackagingUnit() 
    {
        return packagingUnit;
    }
    public void setManufacturer(String manufacturer) 
    {
        this.manufacturer = manufacturer;
    }

    public String getManufacturer() 
    {
        return manufacturer;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("drugId", getDrugId())
            .append("drugCode", getDrugCode())
            .append("drugName", getDrugName())
            .append("drugSpecification", getDrugSpecification())
            .append("packagingUnit", getPackagingUnit())
            .append("manufacturer", getManufacturer())
            .append("unitPrice", getUnitPrice())
            .append("usage", getUsage())
            .toString();
    }
}
