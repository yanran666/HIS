<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryRef"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="挂号ID" prop="appointmentId">
        <el-input
          v-model="queryParams.appointmentId"
          placeholder="请输入挂号ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="医生ID" prop="doctorId">
        <el-input
          v-model="queryParams.doctorId"
          placeholder="请输入医生ID"
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
      :data="recordsList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="病历ID" align="center" prop="medicalRecordId" />
      <el-table-column label="主诉" align="center" prop="chiefComplaint" />
      <el-table-column
        label="现病史"
        align="center"
        prop="presentIllnessHistory"
      />
      <el-table-column
        label="现病治疗情况"
        align="center"
        prop="treatmentHistory"
      />
      <el-table-column label="既往史" align="center" prop="pastHistory" />
      <el-table-column label="过敏史" align="center" prop="allergyHistory" />
      <el-table-column
        label="体格检查"
        align="center"
        prop="physicalExamination"
      />
      <el-table-column label="疾病编码" align="center" prop="diseaseCode" />
      <el-table-column label="疾病名称" align="center" prop="diseaseName" />
      <el-table-column label="国际ICD编码" align="center" prop="icdCode" />
      <el-table-column label="疾病类型" align="center" prop="diseaseType" />
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
            v-hasPermi="['records:records:edit']"
            >修改</el-button
          >
          <el-button
            link
            type="primary"
            icon="Delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['records:records:remove']"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <pagination
      style="background-color: #e8eef2"
      v-show="total > 0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改病历对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="recordsRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="挂号ID" prop="appointmentId">
          <el-input v-model="form.appointmentId" placeholder="请输入挂号ID" />
        </el-form-item>
        <el-form-item label="医生ID" prop="doctorId">
          <el-input v-model="form.doctorId" placeholder="请输入医生ID" />
        </el-form-item>
        <el-form-item label="疾病ID" prop="diseaseId">
          <el-input v-model="form.diseaseId" placeholder="请输入疾病ID" />
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
        <el-form-item label="主诉" prop="chiefComplaint">
          <el-input v-model="form.chiefComplaint" placeholder="请输入主诉" />
        </el-form-item>
        <el-form-item label="现病史" prop="presentIllnessHistory">
          <el-input
            v-model="form.presentIllnessHistory"
            type="textarea"
            placeholder="请输入内容"
          />
        </el-form-item>
        <el-form-item label="现病治疗情况" prop="treatmentHistory">
          <el-input
            v-model="form.treatmentHistory"
            type="textarea"
            placeholder="请输入内容"
          />
        </el-form-item>
        <el-form-item label="既往史" prop="pastHistory">
          <el-input
            v-model="form.pastHistory"
            type="textarea"
            placeholder="请输入内容"
          />
        </el-form-item>
        <el-form-item label="过敏史" prop="allergyHistory">
          <el-input
            v-model="form.allergyHistory"
            type="textarea"
            placeholder="请输入内容"
          />
        </el-form-item>
        <el-form-item label="体格检查" prop="physicalExamination">
          <el-input
            v-model="form.physicalExamination"
            type="textarea"
            placeholder="请输入内容"
          />
        </el-form-item>
        <el-form-item label="注意事项" prop="notes">
          <el-input
            v-model="form.notes"
            type="textarea"
            placeholder="请输入内容"
          />
        </el-form-item>
        <el-form-item label="疾病编码" prop="diseaseCode">
          <el-input v-model="form.diseaseCode" placeholder="请输入疾病编码" />
        </el-form-item>
        <el-form-item label="疾病名称" prop="diseaseName">
          <el-input v-model="form.diseaseName" placeholder="请输入疾病名称" />
        </el-form-item>
        <el-form-item label="国际ICD编码" prop="icdCode">
          <el-input v-model="form.icdCode" placeholder="请输入国际ICD编码" />
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
<script setup name="Records">
import {
  listRecords,
  getRecords,
  delRecords,
  addRecords,
  updateRecords,
} from "@/api/records/records";
import { ref, reactive, toRefs, getCurrentInstance } from "vue";

const { proxy } = getCurrentInstance();

const recordsList = ref([]);
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
    appointmentId: null,
    doctorId: null,
    diseaseId: null,
    clinicDate: null,
    chiefComplaint: null,
    presentIllnessHistory: null,
    treatmentHistory: null,
    pastHistory: null,
    allergyHistory: null,
    physicalExamination: null,
    notes: null,
    diseaseCode: null,
    diseaseName: null,
    icdCode: null,
    diseaseType: null,
  },
  rules: {},
});

const { queryParams, form, rules } = toRefs(data);

/** 表单重置 */
function reset() {
  console.log("已经重置");
  form.value = {
    medicalRecordId: null,
    appointmentId: null,
    doctorId: null,
    diseaseId: null,
    clinicDate: null,
    chiefComplaint: null,
    presentIllnessHistory: null,
    treatmentHistory: null,
    pastHistory: null,
    allergyHistory: null,
    physicalExamination: null,
    notes: null,
    diseaseCode: null,
    diseaseName: null,
    icdCode: null,
    diseaseType: null,
  };
  proxy.resetForm("recordsRef");
}

/** 查询病历列表 */
function getList() {
  loading.value = true;
  listRecords(queryParams.value).then((response) => {
    recordsList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 调用 reset 方法，确保在组件初始化时立即执行
reset();
getList();

// 取消按钮
function cancel() {
  open.value = false;
  reset();
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
  ids.value = selection.map((item) => item.medicalRecordId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _medicalRecordId = row.medicalRecordId || ids.value;
  getRecords(_medicalRecordId).then((response) => {
    form.value = response.data;
    open.value = true;
    title.value = "修改病历";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["recordsRef"].validate((valid) => {
    if (valid) {
      if (form.value.medicalRecordId != null) {
        updateRecords(form.value).then((response) => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addRecords(form.value).then((response) => {
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
  console.log(1);
  const _medicalRecordIds = row.medicalRecordId || ids.value;
  proxy.$modal
    .confirm('是否确认删除病历编号为"' + _medicalRecordIds + '"的数据项？')
    .then(function () {
      return delRecords(_medicalRecordIds);
    })
    .then(() => {
      getList();
      proxy.$modal.msgSuccess("删除成功");
    })
    .catch(() => {});
}
</script>
