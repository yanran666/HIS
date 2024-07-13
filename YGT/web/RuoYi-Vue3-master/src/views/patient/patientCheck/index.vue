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

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <!-- <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['patient:patientCheck:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['patient:patientCheck:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['patient:patientCheck:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['patient:patientCheck:export']"
        >导出</el-button> -->
      </el-col>
      <right-toolbar
        v-model:showSearch="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="patientCheckList"
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
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template #default="scope">
          <el-button
            link
            type="primary"
            icon="Add"
            @click="handleCreate"
            v-hasPermi="['patient:patientCheck:edit']"
            >创建病历</el-button
          >
          <el-button
            link
            type="primary"
            icon="Edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['patient:patientCheck:edit']"
            >修改</el-button
          >
          <el-button
            link
            type="primary"
            icon="Delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['patient:patientCheck:remove']"
            >跳过</el-button
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

    <!-- 添加或修改患者查看对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form
        ref="patientCheckRef"
        :model="form"
        :rules="rules"
        label-width="80px"
      >
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
<script setup name="PatientCheck">
import {
  listPatientCheck,
  getPatientCheck,
  delPatientCheck,
  addPatientCheck,
  updatePatientCheck,
} from "@/api/patient/patientCheck";
import { ref, reactive, toRefs, getCurrentInstance } from "vue";
import { useRouter } from "vue-router";

const { proxy } = getCurrentInstance();
const router = useRouter();

const patientCheckList = ref([]);
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

/** 查询患者查看列表 */
function getList() {
  loading.value = true;
  listPatientCheck(queryParams.value).then((response) => {
    patientCheckList.value = response.rows;
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
  proxy.resetForm("patientCheckRef");
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

function handleCreate() {
  router.push("/diagnose/records");
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加患者查看";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _appointmentId = row.appointmentId || ids.value;
  getPatientCheck(_appointmentId).then((response) => {
    form.value = response.data;
    open.value = true;
    title.value = "修改患者查看";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["patientCheckRef"].validate((valid) => {
    if (valid) {
      if (form.value.appointmentId != null) {
        updatePatientCheck(form.value).then((response) => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addPatientCheck(form.value).then((response) => {
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
    .confirm('是否确认删除患者查看编号为"' + _appointmentIds + '"的数据项？')
    .then(function () {
      return delPatientCheck(_appointmentIds);
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
    "patient/patientCheck/export",
    {
      ...queryParams.value,
    },
    `patientCheck_${new Date().getTime()}.xlsx`
  );
}

getList();
</script>
