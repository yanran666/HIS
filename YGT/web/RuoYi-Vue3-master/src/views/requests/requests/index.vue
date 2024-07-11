<template>
  <div class="app-container">
    <h3>检查申请</h3>
    <el-table
      v-loading="loading"
      :data="requestsList"
      @selection-change="handleSelectionChange"
      style="width: 800px"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="检查编码" align="center" prop="examCode" />
      <el-table-column label="检查名称" align="center" prop="examName" />
      <el-table-column label="单价" align="center" prop="unitPrice" />
      <el-table-column label="费用分类" align="center" prop="feeCategory" />
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
    <yizhu></yizhu>
    <pagination
      v-show="total > 0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />
    <el-dialog v-model="dialogVisible" title="添加检查申请" width="1200">
      <AddExamDialog v-model:visible="dialogVisible" @add-exam="addExam" />
    </el-dialog>
  </div>
</template>

<script setup name="Requests">
import {
  listRequests,
  getRequests,
  delRequests,
  addRequests,
  updateRequests,
} from "@/api/requests/requests";
import yizhu from "@/views/requests/requests/yizhu.vue";
const { proxy } = getCurrentInstance();
import AddExamDialog from "@/views/examination/examination/AddExamDialog.vue";
const dialogVisible = ref(false);
const requestsList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
  },
  rules: {},
});

const { queryParams, form, rules } = toRefs(data);

/** 查询检查申请列表 */
function getList() {
  loading.value = true;
  listRequests(queryParams.value).then((response) => {
    requestsList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    requestId: null,
    appointmentId: null,
    examCode: null,
    examName: null,
    unitPrice: null,
    feeCategory: null,
    purposeRequirements: null,
    examLocation: null,
    notes: null,
  };
  proxy.resetForm("requestsRef");
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
  ids.value = selection.map((item) => item.requestId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

function addExam(examination) {
  requestsList.value.push(...examination);
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["requestsRef"].validate((valid) => {
    if (valid) {
      if (form.value.requestId != null) {
        updateRequests(form.value).then((response) => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addRequests(form.value).then((response) => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
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

/** 导出按钮操作 */
function handleExport() {
  proxy.download(
    "requests/requests/export",
    {
      ...queryParams.value,
    },
    `requests_${new Date().getTime()}.xlsx`
  );
}

getList();
</script>
