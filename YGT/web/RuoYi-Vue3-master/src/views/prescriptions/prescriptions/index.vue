<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryRef"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item>
        <el-button type="primary" icon="post">开设处方</el-button>
      </el-form-item>
    </el-form>

    <el-table
      v-loading="loading"
      :data="prescriptionsList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="处方ID" align="center" prop="prescriptionId" />
      <el-table-column label="药品名称" align="center" prop="drugName" />
      <el-table-column
        label="药品规格"
        align="center"
        prop="drugSpecification"
      />
      <el-table-column label="单价" align="center" prop="unitPrice" />
      <el-table-column label="用法" align="center" prop="usage" />
      <el-table-column label="数量" align="center" prop="quantity" />
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
            v-hasPermi="['prescriptions:prescriptions:edit']"
            >修改</el-button
          >
          <el-button
            link
            type="primary"
            icon="Delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['prescriptions:prescriptions:remove']"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改处方对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form
        ref="prescriptionsRef"
        :model="form"
        :rules="rules"
        label-width="80px"
      >
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Prescriptions">
import {
  listPrescriptions,
  getPrescriptions,
  delPrescriptions,
  addPrescriptions,
  updatePrescriptions,
} from "@/api/prescriptions/prescriptions";

const { proxy } = getCurrentInstance();

const prescriptionsList = ref([]);
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

/** 查询处方列表 */
function getList() {
  loading.value = true;
  listPrescriptions(queryParams.value).then((response) => {
    prescriptionsList.value = response.rows;
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
    prescriptionId: null,
    appointmentId: null,
    drugName: null,
    drugSpecification: null,
    unitPrice: null,
    usage: null,
    quantity: null,
  };
  proxy.resetForm("prescriptionsRef");
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
  ids.value = selection.map((item) => item.prescriptionId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加处方";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _prescriptionId = row.prescriptionId || ids.value;
  getPrescriptions(_prescriptionId).then((response) => {
    form.value = response.data;
    open.value = true;
    title.value = "修改处方";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["prescriptionsRef"].validate((valid) => {
    if (valid) {
      if (form.value.prescriptionId != null) {
        updatePrescriptions(form.value).then((response) => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addPrescriptions(form.value).then((response) => {
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
  const _prescriptionIds = row.prescriptionId || ids.value;
  proxy.$modal
    .confirm('是否确认删除处方编号为"' + _prescriptionIds + '"的数据项？')
    .then(function () {
      return delPrescriptions(_prescriptionIds);
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
    "prescriptions/prescriptions/export",
    {
      ...queryParams.value,
    },
    `prescriptions_${new Date().getTime()}.xlsx`
  );
}

getList();
</script>
