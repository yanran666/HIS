<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryRef"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="病历号" prop="medicalRecordNumber">
        <el-input
          v-model="queryParams.medicalRecordNumber"
          placeholder="请输入病历号"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="患者姓名" prop="patientName">
        <el-input
          v-model="queryParams.patientName"
          placeholder="请输入患者姓名"
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

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['feeRecords:feeRecords:add']"
          >新增</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['feeRecords:feeRecords:edit']"
          >修改</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['feeRecords:feeRecords:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['feeRecords:feeRecords:export']"
          >导出</el-button
        >
      </el-col>
      <right-toolbar
        v-model:showSearch="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="feeRecordsList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="收费ID" align="center" prop="chargeId" />
      <el-table-column label="项目名称" align="center" prop="itemName" />
      <el-table-column label="单价" align="center" prop="unitPrice" />
      <el-table-column label="类型" align="center" prop="category" />
      <el-table-column label="规格" align="center" prop="specification" />
      <el-table-column
        label="开立时间"
        align="center"
        prop="issueDate"
        width="180"
      >
        <template #default="scope">
          <span>{{ parseTime(scope.row.issueDate, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column label="数量" align="center" prop="amount" />
      <el-table-column label="状态" align="center" prop="status" />
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
            v-hasPermi="['feeRecords:feeRecords:edit']"
            >修改</el-button
          >
          <el-button
            link
            type="primary"
            icon="Delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['feeRecords:feeRecords:remove']"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <pagination
      style="background-color: #e8eef2"
      v-show="total > 0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />
  </div>
</template>

<script setup name="FeeRecords">
import {
  listFeeRecords,
  getFeeRecords,
  delFeeRecords,
  addFeeRecords,
  updateFeeRecords,
} from "@/api/feeRecords/feeRecords";

const { proxy } = getCurrentInstance();

const feeRecordsList = ref([]);
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
    medicalRecordNumber: null,
    patientName: null,
  },
  rules: {},
});

const { queryParams, form, rules } = toRefs(data);

/** 查询收费列表 */
function getList() {
  loading.value = true;
  listFeeRecords(queryParams.value).then((response) => {
    feeRecordsList.value = response.rows;
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
    chargeId: null,
    appointmentId: null,
    medicalRecordNumber: null,
    patientName: null,
    idNumber: null,
    age: null,
    gender: null,
    itemName: null,
    unitPrice: null,
    category: null,
    specification: null,
    issueDate: null,
    amount: null,
    status: null,
  };
  proxy.resetForm("feeRecordsRef");
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
  ids.value = selection.map((item) => item.chargeId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加收费";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _chargeId = row.chargeId || ids.value;
  getFeeRecords(_chargeId).then((response) => {
    form.value = response.data;
    open.value = true;
    title.value = "修改收费";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["feeRecordsRef"].validate((valid) => {
    if (valid) {
      if (form.value.chargeId != null) {
        updateFeeRecords(form.value).then((response) => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addFeeRecords(form.value).then((response) => {
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
  const _chargeIds = row.chargeId || ids.value;
  proxy.$modal
    .confirm('是否确认删除收费编号为"' + _chargeIds + '"的数据项？')
    .then(function () {
      return delFeeRecords(_chargeIds);
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
    "feeRecords/feeRecords/export",
    {
      ...queryParams.value,
    },
    `feeRecords_${new Date().getTime()}.xlsx`
  );
}

getList();
</script>
