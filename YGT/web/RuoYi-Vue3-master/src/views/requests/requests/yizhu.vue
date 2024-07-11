<template>
  <div>
    <el-form
      ref="formRef"
      :model="formData"
      :rules="rules"
      size="large"
      label-width="92px"
      label-position="left"
    >
      <h3>医嘱</h3>
      <el-row gutter="15">
        <el-form-item label="目的要求：" prop="purposeRequirements">
          <el-input
            v-model="formData.purposeRequirements"
            type="textarea"
            placeholder="请输入目的要求："
            :autosize="{ minRows: 4, maxRows: 4 }"
            :style="{ width: '600px' }"
          ></el-input>
        </el-form-item>
      </el-row>
      <el-row gutter="15">
        <el-form-item label="检验部位：" prop="examLocation">
          <el-input
            v-model="formData.examLocation"
            type="text"
            placeholder="请输入检验部位："
            clearable
            :style="{ width: '600px' }"
          ></el-input>
        </el-form-item>
      </el-row>
      <el-row gutter="15">
        <el-form-item label="备注：" prop="notes">
          <el-input
            v-model="formData.notes"
            type="textarea"
            placeholder="请输入备注："
            :autosize="{ minRows: 4, maxRows: 4 }"
            :style="{ width: '600px' }"
          ></el-input>
        </el-form-item>
      </el-row>
      <el-form-item>
        <el-button type="primary" @click="submitForm">提交</el-button>
        <el-button @click="resetForm">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script setup>
import { ElMessage } from "element-plus";
const formRef = ref();
const data = reactive({
  formData: {
    purposeRequirements: undefined,
    examLocation: undefined,
    notes: undefined,
  },
  rules: {
    purposeRequirements: [
      {
        required: true,
        message: "请输入目的要求：",
        trigger: "blur",
      },
    ],
    examLocation: [
      {
        required: true,
        message: "请输入检验部位：",
        trigger: "blur",
      },
    ],
    notes: [
      {
        required: true,
        message: "请输入备注：",
        trigger: "blur",
      },
    ],
  },
});
const { formData, rules } = toRefs(data);
/**
 * @name: 表单提交
 * @description: 表单提交方法
 * @return {*}
 */
function submitForm() {
  formRef.value.validate((valid) => {
    if (!valid) return;
    // TODO 提交表单
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
