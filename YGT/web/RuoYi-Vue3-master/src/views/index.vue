<template>
  <div class="block text-center" style="text-align: center">
    <el-carousel height="385px" class="head">
      <el-carousel-item v-for="item in imageUrl" :key="item">
        <img :src="item.url" alt="" class="image" />
      </el-carousel-item>
    </el-carousel>
  </div>
  <div class="below">
    <el-card class="index" title="操作日志">
      <h3 class="text">操作日志</h3>
      <index></index>
    </el-card>
    <el-card style="max-width: 520px" class="calendar">
      <el-calendar v-model="value" />
    </el-card>
  </div>
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
.text {
  margin: 0px;
  margin-left: 30px;
  display: block;
  height: 30px;
  align-content: center;
}
.head {
  background-color: rgb(150, 191, 233); /* 深蓝灰色 */
}

.below {
  background-color: rgb(150, 170, 199); /* 深灰色 */
  display: block;
  height: 660px;
}

.image {
  width: 1100px;
}

.calendar {
  background-color: rgb(174, 214, 241); /* 浅蓝灰色 */
  margin: 40px;
  float: right;
  height: auto;
}

.index {
  background-color: rgb(174, 214, 241); /* 浅蓝灰色 */
  margin: 40px;
  width: 1000px;
  height: auto;
  float: left;
}
</style>
