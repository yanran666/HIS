<template>
  <div class="app-container">
    <el-form
      ref="formRef"
      :model="formData"
      :rules="rules"
      size="large"
      label-width="92px"
      label-position="left"
      style="background-color: whitesmoke"
    >
      <el-form-item>
        <div style="width: 1000px">
          <el-button type="primary" icon="post" @click="submitForm"
            >开设处方</el-button
          >
          <el-table
            v-loading="loading"
            :data="formData.prescriptionsList"
            @selection-change="handleSelectionChange"
          >
            <el-table-column type="selection" width="55" align="center" />
            <el-table-column
              label="处方ID"
              align="center"
              prop="prescriptionId"
            />
            <el-table-column label="药品名称" align="center" prop="drugName" />
            <el-table-column
              label="药品规格"
              align="center"
              prop="drugSpecification"
            />
            <el-table-column label="单价" align="center" prop="unitPrice" />
            <el-table-column label="用法" align="center" prop="usage" />
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
              <template #default="scope">
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
          <el-dialog v-model="dialogVisible" title="添加药品" width="1200">
            <AddDrugDialog
              v-model:visible="dialogVisible"
              @add-drug="addDrug"
            />
          </el-dialog>
          <pagination
            v-show="total > 0"
            :total="total"
            v-model:page="queryParams.pageNum"
            v-model:limit="queryParams.pageSize"
            @pagination="getList"
          />
        </div>
      </el-form-item>
      <el-row>
        <el-button @click="submitForm">提交</el-button>
      </el-row>
    </el-form>
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
import AddDrugDialog from "@/views/drug/drug/AddDrugDialog.vue";
import { reactive, ref } from "vue";
import { ElMessage } from "element-plus";
const dialogVisible = ref(false);
const prescriptionsList = ref([]);
const loading = ref(true);
const ids = ref([]);
const total = ref(0);

const formRef = ref();
const formData = reactive({
  prescriptionsList: [],
});
const queryParams = reactive({
  pageNum: 1,
  pageSize: 10,
});

function handleSelectionChange(selection) {
  ids.value = selection.map((item) => item.prescriptionId);
}

function handleDelete(row) {
  const _prescriptionIds = row ? [row.prescriptionId] : ids.value;
  delPrescriptions(_prescriptionIds).then(() => {
    getList();
  });
}

function getList() {
  loading.value = true;
  listPrescriptions(queryParams).then((response) => {
    formData.prescriptionsList = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

function submitForm() {
  formRef.value.validate((valid) => {
    if (!valid) return;
    addPrescriptions(formData)
      .then(() => {
        ElMessage.success("提交成功");
        getList();
      })
      .catch((error) => {
        ElMessage.error("提交失败: " + error.message);
      });
  });
}

function addDrug(drugs) {
  formData.prescriptionsList.push(...drugs);
  dialogVisible.value = false;
}

getList();
</script>
