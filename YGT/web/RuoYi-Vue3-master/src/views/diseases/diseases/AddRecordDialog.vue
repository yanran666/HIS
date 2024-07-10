<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryRef"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="疾病名称" prop="diseaseName">
        <el-input
          v-model="queryParams.diseaseName"
          placeholder="请输入疾病名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="疾病ICD" prop="icdCode">
        <el-input
          v-model="queryParams.icdCode"
          placeholder="请输入疾病ICD"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="疾病类型" prop="diseaseType">
        <el-input
          v-model="queryParams.diseaseType"
          placeholder="请输入疾病类型"
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

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button plain @click="handleAdd">增加</el-button>
      </el-col>
    </el-row>

    <el-table
      size="small"
      v-loading="loading"
      :data="diseasesList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="疾病编码" align="center" prop="diseaseCode" />
      <el-table-column label="疾病名称" align="center" prop="diseaseName" />
      <el-table-column label="疾病ICD" align="center" prop="icdCode" />
      <el-table-column label="疾病类型" align="center" prop="diseaseType" />
    </el-table>
  </div>
</template>

<script setup name="Diseases">
import {
  listDiseases,
  getDiseases,
  delDiseases,
  addDiseases,
  updateDiseases,
} from "@/api/diseases/diseases";
import { ref, reactive, toRefs, getCurrentInstance } from "vue";

const { proxy } = getCurrentInstance();

const emit = defineEmits(['add-diseases']);

const diseasesList = ref([]);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    diseaseName: null,
    icdCode: null,
    diseaseType: null,
  },
  rules: {},
});

const { queryParams, form, rules } = toRefs(data);

/** 查询疾病列表 */
function getList() {
  loading.value = true;
  listDiseases(queryParams.value).then((response) => {
    diseasesList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 表单重置
function reset() {
  form.value = {
    diseaseCode: null,
    diseaseCode: null,
    diseaseName: null,
    icdCode: null,
    diseaseType: null,
  };
  proxy.resetForm("diseasesRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map((item) => item.diseaseCode);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

function handleAdd() {
  // 向父组件发送选中的疾病记录
  emit('add-diseases', diseasesList.value.filter(disease => ids.value.includes(disease.diseaseCode)));
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _diseaseCodes = row.diseaseCode || ids.value;
  proxy.$modal
    .confirm('是否确认删除疾病编号为"' + _diseaseCodes + '"的数据项？')
    .then(function () {
      return delDiseases(_diseaseCodes);
    })
    .then(() => {
      getList();
      proxy.$modal.msgSuccess("删除成功");
    })
    .catch(() => {});
}

getList();
</script>

<style>
.page {
  margin-right: 30px;
}
</style>
