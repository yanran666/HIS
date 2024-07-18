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
      <el-form-item label="姓名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入姓名"
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
      :data="cancel_appointmentList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="挂号ID" align="center" prop="appointmentId" />
      <el-table-column
        label="病历号"
        align="center"
        prop="medicalRecordNumber"
      />
      <el-table-column label="姓名" align="center" prop="name" />
      <el-table-column label="性别" align="center" prop="gender" />
      <el-table-column label="身份证号码" align="center" prop="idNumber" />
      <el-table-column label="收费方式" align="center" prop="paymentMethod" />
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template #default="scope">
          <el-button
            link
            type="primary"
            icon="Delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['cancel_appointment:cancel_appointment:remove']"
            >退号</el-button
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

    <!-- 添加或修改退号对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form
        ref="cancel_appointmentRef"
        :model="form"
        :rules="rules"
        label-width="80px"
      >
        <el-form-item label="医生ID" prop="doctorId">
          <el-input v-model="form.doctorId" placeholder="请输入医生ID" />
        </el-form-item>
        <el-form-item label="病历号" prop="medicalRecordNumber">
          <el-input
            v-model="form.medicalRecordNumber"
            placeholder="请输入病历号"
          />
        </el-form-item>
        <el-form-item label="姓名" prop="name">
          <el-input v-model="form.name" placeholder="请输入姓名" />
        </el-form-item>
        <el-form-item label="年龄" prop="age">
          <el-input v-model="form.age" placeholder="请输入年龄" />
        </el-form-item>
        <el-form-item label="出生日期" prop="dob">
          <el-date-picker
            clearable
            v-model="form.dob"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择出生日期"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="身份证号码" prop="idNumber">
          <el-input v-model="form.idNumber" placeholder="请输入身份证号码" />
        </el-form-item>
        <el-form-item label="住址" prop="address">
          <el-input
            v-model="form.address"
            type="textarea"
            placeholder="请输入内容"
          />
        </el-form-item>
        <el-form-item label="就诊日期" prop="clinicDate">
          <el-date-picker
            clearable
            v-model="form.clinicDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择就诊日期"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="就诊科室" prop="department">
          <el-input v-model="form.department" placeholder="请输入就诊科室" />
        </el-form-item>
        <el-form-item label="就诊医生" prop="attendingDoctor">
          <el-input
            v-model="form.attendingDoctor"
            placeholder="请输入就诊医生"
          />
        </el-form-item>
        <el-form-item label="初始号额" prop="initialQuota">
          <el-input v-model="form.initialQuota" placeholder="请输入初始号额" />
        </el-form-item>
        <el-form-item label="已用号额" prop="usedQuota">
          <el-input v-model="form.usedQuota" placeholder="请输入已用号额" />
        </el-form-item>
        <el-form-item label="应收金额" prop="receivableAmount">
          <el-input
            v-model="form.receivableAmount"
            placeholder="请输入应收金额"
          />
        </el-form-item>
        <el-form-item label="收费方式" prop="paymentMethod">
          <el-input v-model="form.paymentMethod" placeholder="请输入收费方式" />
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

<script setup name="Cancel_appointment">
import {
  listCancel_appointment,
  getCancel_appointment,
  delCancel_appointment,
  addCancel_appointment,
  updateCancel_appointment,
} from "@/api/cancel_appointment/cancel_appointment";

const { proxy } = getCurrentInstance();

const cancel_appointmentList = ref([]);
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
    name: null,
  },
  rules: {},
});

const { queryParams, form, rules } = toRefs(data);

/** 查询退号列表 */
function getList() {
  loading.value = true;
  listCancel_appointment(queryParams.value).then((response) => {
    cancel_appointmentList.value = response.rows;
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
    appointmentId: null,
    doctorId: null,
    medicalRecordNumber: null,
    name: null,
    gender: null,
    age: null,
    dob: null,
    idNumber: null,
    address: null,
    settlementType: null,
    clinicDate: null,
    session: null,
    department: null,
    registrationType: null,
    attendingDoctor: null,
    initialQuota: null,
    usedQuota: null,
    medicalRecordStatus: null,
    receivableAmount: null,
    paymentMethod: null,
  };
  proxy.resetForm("cancel_appointmentRef");
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
  ids.value = selection.map((item) => item.appointmentId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加退号";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _appointmentId = row.appointmentId || ids.value;
  getCancel_appointment(_appointmentId).then((response) => {
    form.value = response.data;
    open.value = true;
    title.value = "修改退号";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["cancel_appointmentRef"].validate((valid) => {
    if (valid) {
      if (form.value.appointmentId != null) {
        updateCancel_appointment(form.value).then((response) => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addCancel_appointment(form.value).then((response) => {
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
  const _appointmentIds = row.appointmentId || ids.value;
  proxy.$modal
    .confirm('是否确认删除退号编号为"' + _appointmentIds + '"的数据项？')
    .then(function () {
      return delCancel_appointment(_appointmentIds);
    })
    .then(() => {
      getList();
      proxy.$modal.msgSuccess("退号成功");
    })
    .catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download(
    "cancel_appointment/cancel_appointment/export",
    {
      ...queryParams.value,
    },
    `cancel_appointment_${new Date().getTime()}.xlsx`
  );
}

getList();
</script>
