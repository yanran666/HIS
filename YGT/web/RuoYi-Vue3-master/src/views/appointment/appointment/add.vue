<template>
  <div>
    <el-row :gutter="10">
      <el-form
        ref="formRef"
        :model="formData"
        :rules="rules"
        size="small"
        label-width="78px"
        label-position="left"
      >
        <el-col :span="24">
          <el-row gutter="15">
            <el-col :span="8">
              <el-form-item label="病历号" prop="field104">
                <el-input
                  v-model="formData.field104"
                  type="text"
                  placeholder="请输入病历号"
                  clearable
                  :style="{ width: '100%' }"
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="姓名" prop="field103">
                <el-input
                  v-model="formData.field103"
                  type="text"
                  placeholder="请输入姓名"
                  clearable
                  :style="{ width: '100%' }"
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="性别" prop="field102">
                <el-select
                  v-model="formData.field102"
                  placeholder="请输入性别"
                  clearable
                  :style="{ width: '100%' }"
                >
                  <el-option
                    v-for="(item, index) in field102Options"
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
              <el-form-item label="年龄" prop="field106">
                <el-input
                  v-model="formData.field106"
                  type="text"
                  placeholder="请输入年龄"
                  clearable
                  :style="{ width: '100%' }"
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="出生日期" prop="field107">
                <el-date-picker
                  type="text"
                  v-model="formData.field107"
                  format="YYYY-MM-DD"
                  value-format="YYYY-MM-DD"
                  :style="{ width: '100%' }"
                  placeholder="请输入出生日期"
                  clearable
                ></el-date-picker>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="身份证号" prop="field108">
                <el-input
                  v-model="formData.field108"
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
              <el-form-item label="家庭住址" prop="field110">
                <el-input
                  v-model="formData.field110"
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
              <el-form-item label="结算类别" prop="field113">
                <el-select
                  v-model="formData.field113"
                  placeholder="请选择结算类别"
                  clearable
                  :style="{ width: '100%' }"
                >
                  <el-option
                    v-for="(item, index) in field113Options"
                    :key="index"
                    :label="item.label"
                    :value="item.value"
                    :disabled="item.disabled"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="看诊日期" prop="field115">
                <el-date-picker
                  v-model="formData.field115"
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
              <el-form-item label="午别" prop="field114">
                <el-select
                  v-model="formData.field114"
                  placeholder="请选择午别"
                  :disabled="true"
                  clearable
                  :style="{ width: '100%' }"
                >
                  <el-option
                    v-for="(item, index) in field114Options"
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
              <el-form-item label="挂号科室" prop="field120">
                <el-select
                  v-model="formData.field120"
                  placeholder="请选择挂号科室"
                  clearable
                  :style="{ width: '100%' }"
                >
                  <el-option
                    v-for="(item, index) in field120Options"
                    :key="index"
                    :label="item.label"
                    :value="item.value"
                    :disabled="item.disabled"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="号别" prop="field136">
                <el-select
                  v-model="formData.field136"
                  placeholder="请输入号别"
                  clearable
                  :style="{ width: '100%' }"
                >
                  <el-option
                    v-for="(item, index) in field136Options"
                    :key="index"
                    :label="item.label"
                    :value="item.value"
                    :disabled="item.disabled"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="看诊医生" prop="field122">
                <el-select
                  v-model="formData.field122"
                  placeholder="请选择看诊医生"
                  clearable
                  :style="{ width: '100%' }"
                >
                  <el-option
                    v-for="(item, index) in field122Options"
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
              <el-form-item label="初始号额" prop="field124">
                <el-input
                  v-model="formData.field124"
                  type="text"
                  placeholder="请选择初始号额"
                  clearable
                  :style="{ width: '100%' }"
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="已用号额" prop="field138">
                <el-input
                  v-model="formData.field138"
                  type="text"
                  placeholder="请输入已用号额"
                  clearable
                  :style="{ width: '100%' }"
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="病历本" prop="field126" required>
                <el-switch v-model="formData.field126"></el-switch>
              </el-form-item>
            </el-col>
          </el-row>
        </el-col>
        <el-col :span="23">
          <el-row gutter="15">
            <el-col :span="8">
              <el-form-item label="应收金额" prop="field128">
                <el-input
                  v-model="formData.field128"
                  type="text"
                  placeholder="请选择应收金额"
                  clearable
                  :style="{ width: '100%' }"
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="收费方式" prop="field130">
                <el-select
                  v-model="formData.field130"
                  placeholder="请选择收费方式"
                  clearable
                  :style="{ width: '100%' }"
                >
                  <el-option
                    v-for="(item, index) in field130Options"
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
import { addAppointment } from '@/api/appointment';
const data = reactive({
  formData: {
    field104: undefined,
    field103: undefined,
    field102: 2,
    field106: undefined,
    field107: null,
    field108: undefined,
    field110: undefined,
    field113: undefined,
    field115: "2024-07-20",
    field114: 1,
    field120: undefined,
    field136: 1,
    field122: undefined,
    field124: 1,
    field138: 0,
    field126: true,
    field128: 50,
    field130: 1,
  },
  rules: {
    field104: [
      {
        required: true,
        message: "请输入病历号",
        trigger: "blur",
      },
    ],
    field103: [
      {
        required: true,
        message: "请输入姓名",
        trigger: "blur",
      },
    ],
    field102: [
      {
        required: true,
        message: "请输入性别",
        trigger: "change",
      },
    ],
    field106: [],
    field107: [],
    field108: [
      {
        required: true,
        message: "请输入身份证号",
        trigger: "blur",
      },
    ],
    field110: [],
    field113: [],
    field115: [
      {
        required: true,
        message: "请选择看诊日期",
        trigger: "change",
      },
    ],
    field114: [],
    field120: [
      {
        required: true,
        message: "请选择挂号科室",
        trigger: "change",
      },
    ],
    field136: [],
    field122: [],
    field124: [
      {
        required: true,
        message: "请选择初始号额",
        trigger: "blur",
      },
    ],
    field138: [
      {
        required: true,
        message: "请输入已用号额",
        trigger: "blur",
      },
    ],
    field128: [
      {
        required: true,
        message: "请选择应收金额",
        trigger: "blur",
      },
    ],
    field130: [
      {
        required: true,
        message: "请选择收费方式",
        trigger: "change",
      },
    ],
  },
});
const { formData, rules } = toRefs(data);
const field102Options = ref([
  {
    label: "男",
    value: 1,
  },
  {
    label: "女",
    value: 2,
  },
]);
const field113Options = ref([
  {
    label: "自费",
    value: 1,
  },
  {
    label: "市医保",
    value: 2,
  },
]);
const field114Options = ref([
  {
    label: "上午",
    value: 1,
  },
  {
    label: "下午",
    value: 2,
  },
]);
const field120Options = ref([
  {
    label: "选项一",
    value: 1,
  },
  {
    label: "选项二",
    value: 2,
  },
]);
const field136Options = ref([
  {
    label: "普通号",
    value: 1,
  },
  {
    label: "专家号",
    value: 2,
  },
]);
const field122Options = ref([
  {
    label: "上午",
    value: 1,
  },
  {
    label: "下午",
    value: 2,
  },
]);
const field130Options = ref([
  {
    label: "医保卡",
    value: 1,
  },
  {
    label: "现金",
    value: 2,
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
        ElMessage.success('挂号成功');
        resetForm();
      })
      .catch((error) => {
        ElMessage.error('挂号失败: ' + error.message);
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
<style></style>
