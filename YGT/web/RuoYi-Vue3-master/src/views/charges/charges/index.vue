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
      </el-form-item>
      <div class="patient-info">
        <el-form :model="chargesList" label-width="120px">
          <el-col :span="24">
            <el-row gutter="10">
              <el-col :span="3">
                <el-form-item label="患者姓名" label-width="69">
                  <el-input
                    v-model="patientName"
                    disabled
                    @keyup.enter="handleQuery"
                  ></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="4">
                <el-form-item label="身份证号" label-width="69">
                  <el-input
                    v-model="idNumber"
                    disabled
                    @keyup.enter="handleQuery"
                  ></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="3">
                <el-form-item label="年龄" label-width="69">
                  <el-input
                    v-model="age"
                    disabled
                    @keyup.enter="handleQuery"
                  ></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="3">
                <el-form-item label="性别" label-width="69">
                  <el-input
                    v-model="gender"
                    disabled
                    @keyup.enter="handleQuery"
                  ></el-input>
                </el-form-item>
              </el-col>
            </el-row>
          </el-col>
        </el-form>
      </div>
    </el-form>
    <el-row :gutter="10" class="mb8">
      <el-col :span="12.5">
        <el-button
          type="primary"
          plain
          icon="tickets"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['cancel_appointment:cancel_appointment:remove']"
          >收费结算</el-button
        >
      </el-col>
      <right-toolbar
        v-model:showSearch="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table :data="chargesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="收费ID" align="center" prop="chargeId" />
      <el-table-column label="项目名称" align="center" prop="itemName" />
      <el-table-column label="单价" align="center" prop="unitPrice" />
      <el-table-column label="类型" align="center" prop="category" />
      <el-table-column label="规格" align="center" prop="specification" />
      <el-table-column label="数量" align="center" prop="amount" width="180" />
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
    </el-table>
  </div>
</template>

<script setup name="Charges">
import {
  listCharges,
  getCharges,
  delCharges,
  addCharges,
  updateCharges,
} from "@/api/charges/charges";

const { proxy } = getCurrentInstance();

const chargesList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const idNumber = ref("");
const patientName = ref("");
const age = ref("");
const gender = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    medicalRecordNumber: null,
    patientName: null,
    idNumber: null,
  },
  rules: {},
});

const { queryParams, form, rules } = toRefs(data);

/** 查询收费列表 */
function getList() {
  loading.value = true;
  listCharges(queryParams.value).then((response) => {
    chargesList.value = response.rows;
    total.value = response.total;
    loading.value = false;
    idNumber.value = response.rows[0].idNumber;
    patientName.value = response.rows[0].patientName;
    age.value = response.rows[0].age;
    gender.value = response.rows[0].gender;
  });
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
  };
  proxy.resetForm("chargesRef");
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
  getCharges(_chargeId).then((response) => {
    form.value = response.data;
    open.value = true;
    title.value = "修改收费";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["chargesRef"].validate((valid) => {
    if (valid) {
      if (form.value.chargeId != null) {
        updateCharges(form.value).then((response) => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addCharges(form.value).then((response) => {
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
    .confirm('是否确认收费编号为"' + _chargeIds + '"的项目？')
    .then(function () {
      return delCharges(_chargeIds);
    })
    .then(() => {
      getList();
      proxy.$modal.msgSuccess("收费成功");
    })
    .catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download(
    "charges/charges/export",
    {
      ...queryParams.value,
    },
    `charges_${new Date().getTime()}.xlsx`
  );
}
</script>
<style></style>
