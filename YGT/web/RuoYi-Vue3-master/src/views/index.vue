<template>
  <div class="block text-center" style="text-align: center">
    <el-carousel height="385px">
      <el-carousel-item v-for="item in imageUrl" :key="item">
        <img :src="item.url" alt="" class="image" />
      </el-carousel-item>
    </el-carousel>
    <div>
      <el-card class="index">
        <index></index>
      </el-card>
    </div>
  </div>
  <el-card style="max-width: 520px" class="calendar">
    <el-calendar v-model="value" />
  </el-card>
</template>

<script setup lang="ts">
import { ref } from "vue";
import index from "E:/GitHub/HIS/YGT/web/RuoYi-Vue3-master/src/views/monitor/operlog/index.vue";
const value = ref(new Date());
const imageUrl = [
  {
    url: "https://imgs.699pic.com/images/402/164/589.jpg!seo.v1",
  },
  {
    url: "https://imgs.699pic.com/images/401/954/086.jpg!seo.v1",
  },
  {
    url: "https://imgs.699pic.com/images/402/164/597.jpg!seo.v1",
  },
  {
    url: "https://imgs.699pic.com/images/402/144/418.jpg!seo.v1",
  },
];
</script>
<style>
.image {
  width: 1100px;
}
.calendar {
  margin: auto;
  float: right;
  height: 530px;
}
.index {
  width: 1000px;
  float: left;
}
</style>
