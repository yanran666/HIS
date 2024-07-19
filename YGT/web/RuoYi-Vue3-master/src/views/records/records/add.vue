<template>
  <div class="base">
    <el-form
      ref="formRef"
      :model="formData"
      :rules="rules"
      size="large"
      label-width="92px"
      label-position="left"
      style="background-color: whitesmoke"
    >
      <el-form-item label="主诉" prop="chiefComplaint">
        <el-input
          v-model="formData.chiefComplaint"
          type="text"
          placeholder="请输入主诉"
          clearable
          :style="{ width: '600px' }"
        ></el-input>
      </el-form-item>
      <el-form-item label="现病史" prop="presentIllnessHistory">
        <el-input
          v-model="formData.presentIllnessHistory"
          type="text"
          placeholder="请输入现病史"
          clearable
          :style="{ width: '600px' }"
        ></el-input>
      </el-form-item>
      <el-form-item label="现病治疗情况" prop="treatmentHistory">
        <el-input
          v-model="formData.treatmentHistory"
          type="text"
          placeholder="请输入现病治疗情况"
          clearable
          :style="{ width: '600px' }"
        ></el-input>
      </el-form-item>
      <el-form-item label="既往史" prop="pastHistory">
        <el-input
          v-model="formData.pastHistory"
          type="text"
          placeholder="请输入既往史"
          clearable
          :style="{ width: '600px' }"
        ></el-input>
      </el-form-item>
      <el-form-item label="过敏史" prop="allergyHistory">
        <el-input
          v-model="formData.allergyHistory"
          type="text"
          placeholder="请输入过敏史"
          clearable
          :style="{ width: '600px' }"
        ></el-input>
      </el-form-item>
      <el-form-item label="体格检查" prop="physicalExamination">
        <el-input
          v-model="formData.physicalExamination"
          type="text"
          placeholder="请输入体格检查"
          clearable
          :style="{ width: '600px' }"
        ></el-input>
      </el-form-item>
      <el-form-item label="诊断">
        <div>
          <el-table
            
            :data="recordsList"
            @selection-change="handleSelectionChange"
          >
            <el-table-column type="selection" width="30" align="center" />
            <el-table-column
              label="疾病编码"
              align="center"
              prop="diseaseCode"
              width="90px"
            />
            <el-table-column
              label="疾病名称"
              align="center"
              prop="diseaseName"
              width="100px"
            />
            <el-table-column
              label="国际ICD编码"
              align="center"
              prop="icdCode"
              width="120px"
            />
            <el-table-column
              label="疾病类型"
              align="center"
              prop="diseaseType"
              width="100px"
            />
            <el-table-column width="120px">
              <template #header>
                <el-button link type="primary" @click="handleDelete"
                  >删除</el-button
                >
                <el-button link type="primary" @click="dialogVisible = true"
                  >增加</el-button
                >
              </template>
            </el-table-column>
          </el-table>
          <el-dialog v-model="dialogVisible" title="添加疾病诊断" width="1200">
            <AddRecordDialog
              v-model:visible="dialogVisible"
              @add-diseases="addDiseases"
            />
          </el-dialog>
        </div>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm">提交</el-button>
        <el-button @click="resetForm">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script setup>
import { onMounted, ref, reactive, getCurrentInstance } from "vue";
import { ElMessage } from "element-plus";
import { listRecords, addRecords } from "@/api/records/records";
import AddRecordDialog from "@/views/diseases/diseases/AddRecordDialog.vue";

const dialogVisible = ref(false);
const formRef = ref();
const { proxy } = getCurrentInstance();
const recordsList = ref([]);
const loading = ref(true);
const ids = ref([]);
const total = ref(0);

const formData = reactive({
  chiefComplaint: "",
  presentIllnessHistory: "",
  treatmentHistory: "",
  pastHistory: "",
  allergyHistory: "",
  physicalExamination: "",
  recordsList: [],
});

const queryParams = reactive({
  pageNum: 1,
  pageSize: 10,
});

const rules = reactive({
  chiefComplaint: [{ required: true, message: "请输入主诉", trigger: "blur" }],
  presentIllnessHistory: [
    { required: true, message: "请输入现病史", trigger: "blur" },
  ],
  treatmentHistory: [
    { required: true, message: "请输入现病治疗情况", trigger: "blur" },
  ],
  pastHistory: [{ required: true, message: "请输入既往史", trigger: "blur" }],
  allergyHistory: [
    { required: true, message: "请输入过敏史", trigger: "blur" },
  ],
  physicalExamination: [
    { required: true, message: "请输入体感检查", trigger: "blur" },
  ],
});

function getList() {
  loading.value = true;
  listRecords(queryParams).then((response) => {
    recordsList.value = response.rows;
    total.value = response.total;
    loading.value = false;
    resetForm();
  });
}

function handleSelectionChange(selection) {
  ids.value = selection.map((item) => item.medicalRecordId);
}

function submitForm() {
  formRef.value.validate((valid) => {
    if (!valid) return;
    // 提交表单
    console.log(formData); // 检查输出的数据格式
    addRecords(formData)
      .then((response) => {
        ElMessage.success("添加成功");
        resetForm();
      })
      .catch((error) => {
        ElMessage.error("添加失败: " + error.message);
      });
  });
}

function resetForm() {
  console.log("已经重置");
  formRef.value.resetFields();
  recordsList.value = [];
  formData.recordsList = [];
}

function addDiseases(diseases) {
  recordsList.value.push(...diseases);
  formData.recordsList.push(...diseases);
  dialogVisible.value = false;
}

function handleDelete() {
  if (ids.value.length === 0) {
    ElMessage.warning("请选择要删除的记录");
    return;
  }
  // 过滤掉选中的记录
  recordsList.value = recordsList.value.filter(
    (item) => !ids.value.includes(item.medicalRecordId)
  );
  formData.recordsList = formData.recordsList.filter(
    (item) => !ids.value.includes(item.medicalRecordId)
  );
  ids.value = []; // 清空选中的记录
  ElMessage.success("删除成功");
}

onMounted(() => {
  recordsList.value = [];
  formData.recordsList = [];
  getList();
});
</script>

<style>
.base {
  margin: 50px;
  display: block;
  width: 900px;
  padding-left: 100px;
}
</style>
