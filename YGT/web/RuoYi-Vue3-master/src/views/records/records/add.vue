<template>
  <div class="base">
    <el-form
      ref="formRef"
      :model="formData"
      :rules="rules"
      size="default"
      label-width="100px"
      label-position="left"
    >
      <el-form-item label="主诉" prop="chiefComplaint">
        <el-input
          v-model="formData.chiefComplaint"
          type="text"
          placeholder="请输入主诉"
          clearable
          :style="{ width: '100%' }"
        ></el-input>
      </el-form-item>
      <el-form-item label="现病史" prop="presentIllnessHistory">
        <el-input
          v-model="formData.presentIllnessHistory"
          type="text"
          placeholder="请输入现病史"
          clearable
          :style="{ width: '100%' }"
        ></el-input>
      </el-form-item>
      <el-form-item
        label-width="106px"
        label="现病治疗情况"
        prop="treatmentHistory"
      >
        <el-input
          v-model="formData.treatmentHistory"
          type="text"
          placeholder="请输入现病治疗情况"
          clearable
          :style="{ width: '100%' }"
        ></el-input>
      </el-form-item>
      <el-form-item label="既往史" prop="pastHistory">
        <el-input
          v-model="formData.pastHistory"
          type="text"
          placeholder="请输入既往史"
          clearable
          :style="{ width: '100%' }"
        ></el-input>
      </el-form-item>
      <el-form-item label="过敏史" prop="allergyHistory">
        <el-input
          v-model="formData.allergyHistory"
          type="text"
          placeholder="请输入过敏史"
          clearable
          :style="{ width: '100%' }"
        ></el-input>
      </el-form-item>
      <el-form-item
        label-width="106px"
        label="体格检查"
        prop="physicalExamination"
      >
        <el-input
          v-model="formData.physicalExamination"
          type="text"
          placeholder="请输入体格检查"
          clearable
          :style="{ width: '100%' }"
        ></el-input>
      </el-form-item>

      <el-form-item label-width="106px" label="诊断">
        <div>
          <el-table
            v-loading="loading"
            :data="recordsList"
            @selection-change="handleSelectionChange"
          >
            <el-table-column type="selection" width="50" align="center" />
            <el-table-column
              label="病历ID"
              align="center"
              prop="medicalRecordId"
              width="110px"
            />
            <el-table-column
              label="疾病编码"
              align="center"
              prop="diseaseCode"
              width="110px"
            />
            <el-table-column
              label="疾病名称"
              align="center"
              prop="diseaseName"
              width="100px"
            />
            <el-table-column
              label="国际ICD编码"
              align="center"
              prop="icdCode"
              width="150px"
            />
            <el-table-column
              label="疾病类型"
              align="center"
              prop="diseaseType"
              width="100px"
            />
            <el-table-column
              width="100px
            "
            >
              <template #header>
                <el-button>
                  
                </el-button>
              </template>
            </el-table-column>
          </el-table>

          <pagination
            v-show="total > 0"
            :total="total"
            v-model:page="queryParams.pageNum"
            v-model:limit="queryParams.pageSize"
            @pagination="getList"
          />

          <!-- 添加或修改病历对话框 -->
          <el-dialog :title="title" v-model="open" width="500px" append-to-body>
            <el-form
              ref="recordsRef"
              :model="form"
              :rules="rules"
              label-width="80px"
            >
              <el-form-item label="疾病编码" prop="diseaseCode">
                <el-input
                  v-model="form.diseaseCode"
                  placeholder="请输入疾病编码"
                />
              </el-form-item>
              <el-form-item label="疾病名称" prop="diseaseName">
                <el-input
                  v-model="form.diseaseName"
                  placeholder="请输入疾病名称"
                />
              </el-form-item>
              <el-form-item label="国际ICD编码" prop="icdCode">
                <el-input
                  v-model="form.icdCode"
                  placeholder="请输入国际ICD编码"
                />
              </el-form-item>
            </el-form>
            <template #footer>
              <div class="dialog-footer">
                <!-- <el-button type="primary" @click="submitForm">确 定</el-button> -->
                <el-button @click="cancel">取 消</el-button>
              </div>
            </template>
          </el-dialog>
        </div>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm">提交</el-button>
        <el-button @click="resetForm">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script setup>
import { ElMessage } from "element-plus";
import {
  listRecords,
  getRecords,
  delRecords,
  addRecords,
  updateRecords,
} from "@/api/records/records";
const formRef = ref();
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
  },
  rules: {},
  formData: {
    chiefComplaint: undefined,
    presentIllnessHistory: undefined,
    treatmentHistory: undefined,
    pastHistory: undefined,
    allergyHistory: undefined,
    physicalExamination: undefined,
  },
  rules: {
    chiefComplaint: [
      {
        required: true,
        message: "请输入主诉",
        trigger: "blur",
      },
    ],
    presentIllnessHistory: [
      {
        required: true,
        message: "请输入现病史",
        trigger: "blur",
      },
    ],
    treatmentHistory: [
      {
        required: true,
        message: "请输入现病治疗情况",
        trigger: "blur",
      },
    ],
    pastHistory: [
      {
        required: true,
        message: "请输入既往史",
        trigger: "blur",
      },
    ],
    allergyHistory: [
      {
        required: true,
        message: "请输入过敏史",
        trigger: "blur",
      },
    ],
    physicalExamination: [
      {
        required: true,
        message: "请输入体感检查",
        trigger: "blur",
      },
    ],
  },
});
const { queryParams, form, formData, rules } = toRefs(data);
/** 查询病历列表 */
function getList() {
  loading.value = true;
  listRecords(queryParams.value).then((response) => {
    recordsList.value = response.rows;
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

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加病历";
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

/** 删除按钮操作 */
function handleDelete(row) {
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

/** 导出按钮操作 */
function handleExport() {
  proxy.download(
    "records/records/export",
    {
      ...queryParams.value,
    },
    `records_${new Date().getTime()}.xlsx`
  );
}

getList();
/**
 * @name: 表单提交
 * @description: 表单提交方法
 * @return {*}
 */
function submitForm() {
  formRef.value.validate((valid) => {
    if (!valid) return;
    // TODO 提交表单
  });
}
/**
 * @name: 表单重置
 * @description: 表单重置方法
 * @return {*}
 */
function resetForm() {
  formRef.value.resetFields();
}
</script>
<style>
.zhenduan {
  padding-top: 30px;
}
.base {
  margin: 50px;
  padding-left: 100px;
  padding-right: 600px;
}
</style>
