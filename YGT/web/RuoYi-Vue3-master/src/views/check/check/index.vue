<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryRef"
      :inline="true"
      v-show="showSearch"
      label-width="60px"
    >
      <el-form-item label="申请ID" prop="requestId">
        <el-input
          v-model="queryParams.requestId"
          placeholder="请输入申请ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="挂号ID" prop="appointmentId">
        <el-input
          v-model="queryParams.appointmentId"
          placeholder="请输入挂号ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
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
      <el-form-item label="单价" prop="unitPrice">
        <el-input
          v-model="queryParams.unitPrice"
          placeholder="请输入单价"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>
    <el-table
      v-loading="loading"
      :data="requestsList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="申请ID" align="center" prop="requestId" />
      <el-table-column label="挂号ID" align="center" prop="appointmentId" />
      <el-table-column label="检查编码" align="center" prop="examCode" />
      <el-table-column label="检查名称" align="center" prop="examName" />
      <el-table-column label="单价" align="center" prop="unitPrice" />
      <el-table-column label="费用分类" align="center" prop="feeCategory" />
      <el-table-column
        label="目的和要求"
        align="center"
        prop="purposeRequirements"
      />
      <el-table-column label="检查地点" align="center" prop="examLocation" />
      <el-table-column label="备注" align="center" prop="notes" />
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template #default="scope">
          <el-button
            link
            type="primary"
            icon="Edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['requests:requests:edit']"
            >修改</el-button
          >
          <el-button
            link
            type="primary"
            icon="Delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['requests:requests:remove']"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <pagination
      style="background-color: #e7eef2; /* 深灰色 */"
      v-show="total > 0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />
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

const { proxy } = getCurrentInstance();

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
    requestId: null,
    appointmentId: null,
    examCode: null,
    examName: null,
    unitPrice: null,
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

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加检查申请";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _requestId = row.requestId || ids.value;
  getRequests(_requestId).then((response) => {
    form.value = response.data;
    open.value = true;
    title.value = "修改检查申请";
  });
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
