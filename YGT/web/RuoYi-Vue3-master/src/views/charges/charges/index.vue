<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
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
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
      </el-form-item>
    </el-form>


    <el-table v-loading="loading" :data="chargesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="收费ID" align="center" prop="chargeId" />
      <el-table-column label="项目名称" align="center" prop="itemName" />
      <el-table-column label="单价" align="center" prop="unitPrice" />
      <el-table-column label="类型" align="center" prop="category" />
      <el-table-column label="规格" align="center" prop="specification" />
      <el-table-column label="开立时间" align="center" prop="issueDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.issueDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
    </el-table>

    <!-- 添加或修改收费对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="chargesRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="病历号" prop="medicalRecordNumber">
          <el-input v-model="form.medicalRecordNumber" placeholder="请输入病历号" />
        </el-form-item>
        <el-form-item label="患者姓名" prop="patientName">
          <el-input v-model="form.patientName" placeholder="请输入患者姓名" />
        </el-form-item>
        <el-form-item label="身份证号" prop="idNumber">
          <el-input v-model="form.idNumber" placeholder="请输入身份证号" />
        </el-form-item>
        <el-form-item label="患者年龄" prop="age">
          <el-input v-model="form.age" placeholder="请输入患者年龄" />
        </el-form-item>
        <el-form-item label="患者性别" prop="gender">
          <el-input v-model="form.gender" placeholder="请输入患者性别" />
        </el-form-item>
        <el-form-item label="项目名称" prop="itemName">
          <el-input v-model="form.itemName" placeholder="请输入项目名称" />
        </el-form-item>
        <el-form-item label="单价" prop="unitPrice">
          <el-input v-model="form.unitPrice" placeholder="请输入单价" />
        </el-form-item>
        <el-form-item label="类型" prop="category">
          <el-input v-model="form.category" placeholder="请输入类型" />
        </el-form-item>
        <el-form-item label="规格" prop="specification">
          <el-input v-model="form.specification" placeholder="请输入规格" />
        </el-form-item>
        <el-form-item label="开立时间" prop="issueDate">
          <el-date-picker clearable
            v-model="form.issueDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择开立时间">
          </el-date-picker>
        </el-form-item>
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

<script setup name="Charges">
import { listCharges, getCharges, delCharges, addCharges, updateCharges } from "@/api/charges/charges";

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

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    medicalRecordNumber: null,
    patientName: null,
  },
  rules: {
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询收费列表 */
function getList() {
  loading.value = true;
  listCharges(queryParams.value).then(response => {
    chargesList.value = response.rows;
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
    issueDate: null
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
  ids.value = selection.map(item => item.chargeId);
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
  const _chargeId = row.chargeId || ids.value
  getCharges(_chargeId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改收费";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["chargesRef"].validate(valid => {
    if (valid) {
      if (form.value.chargeId != null) {
        updateCharges(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addCharges(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除收费编号为"' + _chargeIds + '"的数据项？').then(function() {
    return delCharges(_chargeIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('charges/charges/export', {
    ...queryParams.value
  }, `charges_${new Date().getTime()}.xlsx`)
}

getList();
</script>
