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
        <el-input v-model="queryParams.drugCode" placeholder="请输入药品编码" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="药品名称" prop="drugName">
        <el-input v-model="queryParams.drugName" placeholder="请输入药品名称" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>
    <el-table v-loading="loading" :data="drugList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="药品ID" align="center" prop="drugId" />
      <el-table-column label="药品编码" align="center" prop="drugCode" />
      <el-table-column label="药品名称" align="center" prop="drugName" />
      <el-table-column label="药品规格" align="center" prop="drugSpecification" />
      <el-table-column label="包装单位" align="center" prop="packagingUnit" />
      <el-table-column label="生产厂家" align="center" prop="manufacturer" />
      <el-table-column label="单价" align="center" prop="unitPrice" />
      <el-table-column label="用量" align="center" prop="usage" />
    </el-table>
    <el-row :gutter="10" class="mb8 bottom-center">
      <el-col>
        <el-button type="primary" @click="confirmAdd">增加</el-button>
        <el-button plain @click="cancel">取消</el-button>
      </el-col>
    </el-row>
  </div>
</template>

<script setup name="Drug">
import {
  listDrug,
} from "@/api/drug/drug";
import { getCurrentInstance, reactive, ref, toRefs } from "vue";

const { proxy } = getCurrentInstance();
const drugList = ref([]);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const emit = defineEmits(["add-drug"]);
const selectedDrugs = ref([]);
const data = reactive({
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

const { queryParams, rules } = toRefs(data);

function handleQuery() {
  loading.value = true;
  listDrug(queryParams.value).then((response) => {
    drugList.value = response.rows;
    loading.value = false;
  });
}

function resetQuery() {
  Object.assign(queryParams, {
    pageNum: 1,
    pageSize: 10,
    drugCode: null,
    drugName: null,
  });
  handleQuery();
}

function handleSelectionChange(selection) {
  selectedDrugs.value = selection;
}

function confirmAdd() {
  emit("add-drug", selectedDrugs.value);
}

function cancel() {
  proxy.$emit("update:visible", false);
}

handleQuery();
</script>
