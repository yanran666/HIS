<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryRef"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="检查编码" prop="examCode">
        <el-input
          v-model="queryParams.examCode"
          placeholder="请输入检查编码"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="检查名称" prop="examName">
        <el-input
          v-model="queryParams.examName"
          placeholder="请输入检查名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery"
          >搜索</el-button
        >
      </el-form-item>
    </el-form>
    <el-table
      v-loading="loading"
      :data="examinationList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="检查编码" align="center" prop="examCode" />
      <el-table-column label="检查名称" align="center" prop="examName" />
      <el-table-column label="单价" align="center" prop="unitPrice" />
      <el-table-column label="类型" align="center" prop="feeCategory" />
    </el-table>
    <el-row :gutter="10" class="mb8 bottom-center">
      <el-col>
        <el-button primary @click="handleAdd">增加</el-button>
        <el-button plain @click="closeDialog">取消</el-button>
      </el-col>
    </el-row>
  </div>
</template>

<script setup name="Examination">
import {
  listExamination,
  getExamination,
  delExamination,
  addExamination,
  updateExamination,
} from "@/api/examination/examination";

const { proxy } = getCurrentInstance();

const examinationList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const visible = ref(false); // 使用 visible 替代 dialogVisible

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    examCode: null,
    examName: null,
  },
  rules: {},
});
const emit = defineEmits(["add-exam"]);
const { queryParams, form, rules } = toRefs(data);

/** 查询检查列表 */
function getList() {
  loading.value = true;
  listExamination(queryParams.value).then((response) => {
    examinationList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

function closeDialog() {
  visible.value = false; // 关闭对话框
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    examId: null,
    examCode: null,
    examName: null,
    unitPrice: null,
    category: null,
  };
  proxy.resetForm("examinationRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map((item) => item.examId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

function handleAdd() {
  // 过滤选中的数据
  const selectedExams = examinationList.value.filter((examination) =>
    ids.value.includes(examination.examId)
  );
  // 向父组件发送选中的数据
  emit("add-exam", selectedExams);
  // 关闭对话框
  visible.value = false; // 确保关闭对话框
}
getList();
</script>
<style>
.app-container {
  position: relative;
  min-height: 900px; /* 让容器至少撑满一屏高度 */
}

.app-container .bottom-center {
  position: absolute;
  bottom: 10px; /* 调整按钮与底部的距离 */
  left: 50%; /* 水平居中 */
  transform: translateX(-50%);
}
</style>
