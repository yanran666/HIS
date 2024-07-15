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
      <el-form-item style="">
        <div style="width: 1000px">
          <el-button type="primary" icon="post">开设处方</el-button>
          <el-table
            v-loading="loading"
            :data="prescriptionsList"
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
      <el-row><el-button @click="submitForm"> 提交 </el-button></el-row>
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
import { reactive } from "vue";
const { proxy } = getCurrentInstance();
const dialogVisible = ref(false);
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
const formData = reactive({
  prescriptionsList: [],
});
function addDrug(drug) {
  if (!Array.isArray(drug)) {
    console.error('drug is not an array:', drug);
    return;
  }
  prescriptionsList.value.push(...drug);
  formData.prescriptionsList.push(...drug);
  dialogVisible.value = false;
}
const { queryParams, form, rules } = toRefs(data);
const formRef = ref();
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

function submitForm() {
  formRef.value.validate((valid) => {
    if (!valid) return;
    const payload = {
      ...formData,
      prescriptionsList: prescriptionsList.value,
    };

    addDrug(payload)
      .then((response) => {
        ElMessage.success("添加成功");
        resetForm();
        getList();
      })
      .catch((error) => {
        ElMessage.error("添加失败: " + error.message);
      });
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

getList();
</script>
