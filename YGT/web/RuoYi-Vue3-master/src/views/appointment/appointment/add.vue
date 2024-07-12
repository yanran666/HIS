<template>
  <div>
    <el-row :gutter="20" class="basic">
      <el-form
        ref="formRef"
        :model="formData"
        :rules="rules"
        size="large"
        label-width="79px"
        label-position="left"
      >
        <el-col :span="24">
          <el-row gutter="10">
            <el-col :span="8">
              <el-form-item label="病历号" prop="medicalRecordNumber">
                <el-input
                  v-model="formData.medicalRecordNumber"
                  type="text"
                  placeholder="请输入病历号"
                  clearable
                  :style="{ width: '100%' }"
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="姓名" prop="name">
                <el-input
                  v-model="formData.name"
                  type="text"
                  placeholder="请输入姓名"
                  clearable
                  :style="{ width: '100%' }"
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="性别" prop="gender">
                <el-select
                  v-model="formData.gender"
                  placeholder="请输入性别"
                  clearable
                  :style="{ width: '100%' }"
                >
                  <el-option
                    v-for="(item, index) in genderOptions"
                    :key="index"
                    :label="item.label"
                    :value="item.value"
                    :disabled="item.disabled"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>
        </el-col>
        <el-col :span="24">
          <el-row gutter="15">
            <el-col :span="8">
              <el-form-item label="年龄" prop="age">
                <el-input
                  v-model="formData.age"
                  type="text"
                  placeholder="请输入年龄"
                  clearable
                  :style="{ width: '100%' }"
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="出生日期" prop="dob">
                <el-date-picker
                  type="text"
                  v-model="formData.dob"
                  format="YYYY-MM-DD"
                  value-format="YYYY-MM-DD"
                  :style="{ width: '100%' }"
                  placeholder="请输入出生日期"
                  clearable
                ></el-date-picker>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="身份证号" prop="idNumber">
                <el-input
                  v-model="formData.idNumber"
                  type="text"
                  placeholder="请输入身份证号"
                  clearable
                  :style="{ width: '100%' }"
                ></el-input>
              </el-form-item>
            </el-col>
          </el-row>
        </el-col>
        <el-col :span="23">
          <el-row gutter="15">
            <el-col :span="24">
              <el-form-item label="家庭住址" prop="address">
                <el-input
                  v-model="formData.address"
                  type="text"
                  placeholder="请输入家庭住址"
                  clearable
                  :style="{ width: '100%' }"
                ></el-input>
              </el-form-item>
            </el-col>
          </el-row>
        </el-col>
        <el-col :span="23">
          <el-row gutter="15">
            <el-col :span="8">
              <el-form-item label="结算类别" prop="settlementType">
                <el-select
                  v-model="formData.settlementType"
                  placeholder="请选择结算类别"
                  clearable
                  :style="{ width: '100%' }"
                >
                  <el-option
                    v-for="(item, index) in settlementTypeOptions"
                    :key="index"
                    :label="item.label"
                    :value="item.value"
                    :disabled="item.disabled"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="看诊日期" prop="clinicDate">
                <el-date-picker
                  v-model="formData.clinicDate"
                  format="YYYY-MM-DD"
                  value-format="YYYY-MM-DD"
                  :style="{ width: '100%' }"
                  placeholder="请选择看诊日期"
                  clearable
                  :disabled="true"
                ></el-date-picker>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="午别" prop="session">
                <el-select
                  v-model="formData.session"
                  placeholder="请选择午别"
                  :disabled="true"
                  clearable
                  :style="{ width: '100%' }"
                >
                  <el-option
                    v-for="(item, index) in sessionOptions"
                    :key="index"
                    :label="item.label"
                    :value="item.value"
                    :disabled="item.disabled"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>
        </el-col>
        <el-col :span="23">
          <el-row gutter="15">
            <el-col :span="8">
              <el-form-item label="挂号科室" prop="department">
                <el-select
                  v-model="formData.department"
                  placeholder="请选择挂号科室"
                  clearable
                  :style="{ width: '100%' }"
                >
                  <el-option
                    v-for="(item, index) in departmentOptions"
                    :key="index"
                    :label="item.label"
                    :value="item.value"
                    :disabled="item.disabled"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="号别" prop="registrationType">
                <el-select
                  v-model="formData.registrationType"
                  placeholder="请输入号别"
                  clearable
                  :style="{ width: '100%' }"
                >
                  <el-option
                    v-for="(item, index) in registrationTypeOptions"
                    :key="index"
                    :label="item.label"
                    :value="item.value"
                    :disabled="item.disabled"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="看诊医生" prop="attendingDoctor">
                <el-select
                  v-model="formData.attendingDoctor"
                  placeholder="请选择看诊医生"
                  clearable
                  :style="{ width: '100%' }"
                >
                  <el-option
                    v-for="(item, index) in attendingDoctorOptions"
                    :key="index"
                    :label="item.label"
                    :value="item.value"
                    :disabled="item.disabled"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>
        </el-col>
        <el-col :span="23">
          <el-row gutter="15">
            <el-col :span="8">
              <el-form-item label="初始号额" prop="initialQuota">
                <el-input
                  v-model="formData.initialQuota"
                  type="text"
                  placeholder="请选择初始号额"
                  clearable
                  :style="{ width: '100%' }"
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="已用号额" prop="usedQuota">
                <el-input
                  v-model="formData.usedQuota"
                  type="text"
                  placeholder="请输入已用号额"
                  clearable
                  :style="{ width: '100%' }"
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="病历本" prop="medicalRecordStatus" required>
                <el-switch v-model="formData.medicalRecordStatus"></el-switch>
              </el-form-item>
            </el-col>
          </el-row>
        </el-col>
        <el-col :span="23">
          <el-row gutter="15">
            <el-col :span="8">
              <el-form-item label="应收金额" prop="receivableAmount">
                <el-input
                  v-model="formData.receivableAmount"
                  type="text"
                  placeholder="请选择应收金额"
                  clearable
                  :style="{ width: '100%' }"
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="收费方式" prop="paymentMethod">
                <el-select
                  v-model="formData.paymentMethod"
                  placeholder="请选择收费方式"
                  clearable
                  :style="{ width: '100%' }"
                >
                  <el-option
                    v-for="(item, index) in paymentMethodOptions"
                    :key="index"
                    :label="item.label"
                    :value="item.value"
                    :disabled="item.disabled"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>
        </el-col>
        <el-col :span="24">
          <el-form-item>
            <el-button type="primary" @click="submitForm">提交</el-button>
            <el-button @click="resetForm">重置</el-button>
          </el-form-item>
        </el-col>
      </el-form>
    </el-row>
  </div>
</template>
<script setup>
import { ElMessage } from "element-plus";
const formRef = ref();
import { addAppointment } from "@/api/appointment/appointment";
const data = reactive({
  formData: {
    medicalRecordNumber: undefined,
    name: undefined,
    gender: "男",
    age: undefined,
    dob: null,
    idNumber: undefined,
    address: undefined,
    settlementType: undefined,
    clinicDate: "2024-07-20",
    session: 1,
    department: undefined,
    registrationType: 1,
    attendingDoctor: undefined,
    initialQuota: 1,
    usedQuota: 0,
    medicalRecordStatus: true,
    receivableAmount: 50,
    paymentMethod: 1,
  },
  rules: {
    medicalRecordNumber: [
      {
        required: true,
        message: "请输入病历号",
        trigger: "blur",
      },
    ],
    name: [
      {
        required: true,
        message: "请输入姓名",
        trigger: "blur",
      },
    ],
    gender: [
      {
        required: true,
        message: "请输入性别",
        trigger: "change",
      },
    ],
    age: [],
    dob: [],
    idNumber: [
      {
        required: true,
        message: "请输入身份证号",
        trigger: "blur",
      },
    ],
    address: [],
    settlementType: [],
    clinicDate: [
      {
        required: true,
        message: "请选择看诊日期",
        trigger: "change",
      },
    ],
    session: [],
    department: [
      {
        required: true,
        message: "请选择挂号科室",
        trigger: "change",
      },
    ],
    registrationType: [],
    attendingDoctor: [],
    initialQuota: [
      {
        required: true,
        message: "请选择初始号额",
        trigger: "blur",
      },
    ],
    usedQuota: [
      {
        required: true,
        message: "请输入已用号额",
        trigger: "blur",
      },
    ],
    receivableAmount: [
      {
        required: true,
        message: "请选择应收金额",
        trigger: "blur",
      },
    ],
    paymentMethod: [
      {
        required: true,
        message: "请选择收费方式",
        trigger: "change",
      },
    ],
  },
});
const { formData, rules } = toRefs(data);
const genderOptions = ref([
  {
    label: "男",
    value: "男",
  },
  {
    label: "女",
    value: "女",
  },
]);
const settlementTypeOptions = ref([
  {
    label: "自费",
    value: "自费",
  },
  {
    label: "市医保",
    value: "市医保",
  },
]);
const sessionOptions = ref([
  {
    label: "上午",
    value: "上午",
  },
  {
    label: "下午",
    value: "下午",
  },
]);
const departmentOptions = ref([
  {
    label: "科室一",
    value: 101,
  },
  {
    label: "科室二",
    value: 102,
  },
]);
const registrationTypeOptions = ref([
  {
    label: "普通号",
    value: "普通号",
  },
  {
    label: "专家号",
    value: "专家号",
  },
]);
const attendingDoctorOptions = ref([
  {
    label: "101",
    value: 101,
  },
  {
    label: "102",
    value: 102,
  },
]);
const paymentMethodOptions = ref([
  {
    label: "医保卡",
    value: "医保卡",
  },
  {
    label: "现金",
    value: "现金",
  },
]);
/**
 * @name: 表单提交
 * @description: 表单提交方法
 * @return {*}
 */
function submitForm() {
  formRef.value.validate((valid) => {
    if (!valid) return;
    // 提交表单
    addAppointment(formData.value)
      .then((response) => {
        ElMessage.success("挂号成功");
        resetForm();
      })
      .catch((error) => {
        ElMessage.error("挂号失败: 请检查病历号是否重复");
      });
  });
}
/**
 * @name: 表单重置
 * @description: 表单重置方法
 * @return {*}
 */
function resetForm() {
  formRef.value.resetFields();
}
</script>
<style>
.basic {
  margin: 50px;
  padding-left: 100px;
}
</style>
