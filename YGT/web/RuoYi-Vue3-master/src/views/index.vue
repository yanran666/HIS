<template>
  <div class="patient-info">
    <el-form :model="patientInfo" label-width="120px">
      <el-form-item label="患者姓名">
        <el-input v-model="patientInfo.name" disabled></el-input>
      </el-form-item>
      <el-form-item label="身份证号">
        <el-input v-model="patientInfo.idNumber" disabled></el-input>
      </el-form-item>
      <el-form-item label="年龄">
        <el-input v-model="patientInfo.age" disabled></el-input>
      </el-form-item>
      <el-form-item label="性别">
        <el-input v-model="patientInfo.gender" disabled></el-input>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  name: 'PatientInfo',
  data() {
    return {
      patientInfo: {
        name: '李华',
        idNumber: '210200200002021234',
        age: 23,
        gender: '女'
      }
    };
  }
};
</script>

<style scoped>
.patient-info {
  padding: 20px;
}
</style>
