<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryRef"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="药品编码" prop="drugCode">
        <el-input
          v-model="queryParams.drugCode"
          placeholder="请输入药品编码"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="药品名称" prop="drugName">
        <el-input
          v-model="queryParams.drugName"
          placeholder="请输入药品名称"
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
      :data="drugList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="药品ID" align="center" prop="drugId" />
      <el-table-column label="药品编码" align="center" prop="drugCode" />
      <el-table-column label="药品名称" align="center" prop="drugName" />
      <el-table-column
        label="药品规格"
        align="center"
        prop="drugSpecification"
      />
      <el-table-column label="包装单位" align="center" prop="packagingUnit" />
      <el-table-column label="生产厂家" align="center" prop="manufacturer" />
      <el-table-column label="单价" align="center" prop="unitPrice" />
      <el-table-column label="用量" align="center" prop="usage" />
    </el-table>
    <el-row :gutter="10" class="mb8 bottom-center">
      <el-col>
        <el-button primary @click="confirmAdd">增加</el-button>
        <el-button plain @click="cancel">取消</el-button>
      </el-col>
    </el-row>
  </div>
</template>

<script setup name="Drug">
import {
  listDrug,
  getDrug,
  delDrug,
  addDrug,
  updateDrug,
} from "@/api/drug/drug";
import { until } from "@vueuse/core";

const { proxy } = getCurrentInstance();

const drugList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const prescriptionsList = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const emit = defineEmits(["add-drug"]);
const selectedDrugs = ref([]);
const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    drugCode: null,
    drugName: null,
  },
  rules: {
    drugCode: [
      { required: true, message: "药品编码不能为空", trigger: "blur" },
    ],
    drugName: [
      { required: true, message: "药品名称不能为空", trigger: "blur" },
    ],
  },
});

const { queryParams, form, rules } = toRefs(data);

/** 查询药品列表 */
function getList() {
  loading.value = true;
  listDrug(queryParams.value).then((response) => {
    drugList.value = response.rows;
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
    drugId: null,
    drugCode: null,
    drugName: null,
    drugSpecification: null,
    packagingUnit: null,
    manufacturer: null,
    usage: null,
    unitPrice: null,
  };
  proxy.resetForm("drugRef");
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

function handleSelectionChange(selection) {
  selectedDrugs.value = selection;
}
function confirmAdd() {
  emit("add-drug", selectedDrugs.value);
  dialogVisible.value = false;
}
function handleAdd() {
  // 向父组件发送选中的疾病记录
  emit(
    "add-drug",
    prescriptionsList.value.filter((drug) => ids.value.includes(drug.drugCode))
  );
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _drugId = row.drugId || ids.value;
  getDrug(_drugId).then((response) => {
    form.value = response.data;
    open.value = true;
    title.value = "修改药品";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["drugRef"].validate((valid) => {
    if (valid) {
      if (form.value.drugId != null) {
        updateDrug(form.value).then((response) => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addDrug(form.value).then((response) => {
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
  const _drugIds = row.drugId || ids.value;
  proxy.$modal
    .confirm('是否确认删除药品编号为"' + _drugIds + '"的数据项？')
    .then(function () {
      return delDrug(_drugIds);
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
    "drug/drug/export",
    {
      ...queryParams.value,
    },
    `drug_${new Date().getTime()}.xlsx`
  );
}

getList();
</script>
