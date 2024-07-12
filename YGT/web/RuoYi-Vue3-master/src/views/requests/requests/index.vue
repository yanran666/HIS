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
                  <el-button link type="primary">删除</el-button>
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

<script setup name="Requests">
import { ref, reactive, toRefs, getCurrentInstance } from "vue";
import { ElMessage } from "element-plus";
import {
  listRequests,
  getRequests,
  delRequests,
  addRequests,
  updateRequests,
} from "@/api/requests/requests";
import AddExamDialog from "@/views/examination/examination/AddExamDialog.vue";

const formRef = ref();
const { proxy } = getCurrentInstance();

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
  requestsList: [],
  queryParams: {
    pageNum: 1,
    pageSize: 10,
  },
});

const { formData, rules, queryParams, requestsList } = toRefs(data);

const dialogVisible = ref(false);
const loading = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);

/**
 * 表单提交
 */
function submitForm() {
  formRef.value.validate((valid) => {
    if (!valid) return;
    // 提交表单
    console.log(formData.value); // 检查输出的数据格式
    addRequests(formData.value)
      .then((response) => {
        ElMessage.success("添加成功");
        resetForm();
        getList(); // 刷新列表
      })
      .catch((error) => {
        ElMessage.error("添加失败: " + error.message);
      });
  });
}

/**
 * 表单重置
 */
function resetForm() {
  formRef.value.resetFields();
  recordsList.value = [];
  formData.recordsList = [];
}

/**
 * 查询检查申请列表
 */
function getList() {
  loading.value = true;
  listRequests(queryParams.value).then((response) => {
    requestsList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

/**
 * 多选框选中数据
 */
function handleSelectionChange(selection) {
  ids.value = selection.map((item) => item.requestId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/**
 * 添加检查申请
 */
function addExam(examination) {
  requestsList.value.push(...examination);
  dialogVisible.value = false; // 这里确保对话框关闭
  
}

/**
 * 删除按钮操作
 */
function handleDelete(row) {
  const _requestIds = row.requestId || ids.value;
  proxy.$modal
    .confirm('是否确认删除检查申请编号为"' + _requestIds + '"的数据项？')
    .then(function () {
      return delRequests(_requestIds);
    })
    .then(() => {
      getList();
      proxy.$modal.msgSuccess("删除成功");
    })
    .catch(() => {});
}

getList();
</script>
