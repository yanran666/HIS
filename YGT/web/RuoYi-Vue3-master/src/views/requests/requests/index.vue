<template>
  <div class="app-container">
    <h3>检查申请</h3>
    <el-form
      ref="formRef"
      :model="formData"
      :rules="rules"
      size="large"
      label-width="92px"
      label-position="left"
    >
      <el-row gutter="15">
        <el-form-item>
          <div>
            <el-table
              v-loading="loading"
              :data="requestsList"
              @selection-change="handleSelectionChange"
              style="width: 800px"
            >
              <el-table-column type="selection" width="55" align="center" />
              <el-table-column
                label="检查编码"
                align="center"
                prop="examCode"
              />
              <el-table-column
                label="检查名称"
                align="center"
                prop="examName"
              />
              <el-table-column label="单价" align="center" prop="unitPrice" />
              <el-table-column
                label="费用分类"
                align="center"
                prop="feeCategory"
              />
              <el-table-column
                label="操作"
                align="center"
                class-name="small-padding fixed-width"
              >
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
            <el-dialog
              v-model="dialogVisible"
              title="添加检查申请"
              width="1200"
            >
              <AddExamDialog
                v-model:visible="dialogVisible"
                @add-exam="addExam"
              />
            </el-dialog>
          </div>
        </el-form-item>
      </el-row>
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
import { ref, reactive } from "vue";
import { ElMessage } from "element-plus";
import {
  listRequests,
  delRequests,
  addRequests,
} from "@/api/requests/requests";
import AddExamDialog from "@/views/examination/examination/AddExamDialog.vue";

const formRef = ref();
const dialogVisible = ref(false);
const loading = ref(true);
const ids = ref([]);
const requestsList = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);

const formData = reactive({
  purposeRequirements: "",
  examLocation: "",
  notes: "",
  requestsList: [],
});

const rules = reactive({
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
});

const queryParams = reactive({
  pageNum: 1,
  pageSize: 10,
});

function submitForm() {
  formRef.value.validate((valid) => {
    if (!valid) return;
    const payload = {
      ...formData,
      requestsList: requestsList.value,
    };

    addRequests(payload)
      .then((response) => {
        ElMessage.success("添加成功");
        resetForm();
        getList();
      })
      .catch((error) => {
        ElMessage.error("添加失败: " + error.message);
      });
  });
}

function handleDelete() {
  if (ids.value.length === 0) {
    ElMessage.warning("请选择要删除的记录");
    return;
  }
  // 删除选中的记录
  requestsList.value = requestsList.value.filter(
    (item) => !ids.value.includes(item.medicalRecordId)
  );
  formData.requestsList = formData.requestsList.filter(
    (item) => !ids.value.includes(item.medicalRecordId)
  );
  ids.value = []; // 清空选中的记录
  ElMessage.success("删除成功");
}

function resetForm() {
  formRef.value.resetFields();
  requestsList.value = [];
  formData.requestsList = [];
}

function getList() {
  loading.value = true;
  listRequests(queryParams)
    .then((response) => {
      formData.requestsList = response.rows;
      total.value = response.total;
    })
    .finally(() => {
      loading.value = false;
    });
}

function handleSelectionChange(selection) {
  ids.value = selection.map((item) => item.requestId);
  single.value = selection.length !== 1;
  multiple.value = selection.length === 0;
}

function addExam(examination) {
  const uniqueExaminations = examination.filter(
    (exam) =>
      !requestsList.value.some(
        (existingExam) => existingExam.examId === exam.examId
      )
  );

  requestsList.value.push(...uniqueExaminations);
  formData.requestsList.push(...uniqueExaminations);
  dialogVisible.value = false;
}

getList();
</script>
