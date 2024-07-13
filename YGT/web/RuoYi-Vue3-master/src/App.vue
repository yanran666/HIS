<template>
  <router-view />
</template>

<script setup>
import useSettingsStore from "@/store/modules/settings";
import { handleThemeStyle } from "@/utils/theme";

onMounted(() => {
  nextTick(() => {
    // 初始化主题样式
    handleThemeStyle(useSettingsStore().theme);
  });
});
</script>
<style>
body,
html {
  background-color: #e7eef2; /* 深灰色 */
  padding: 0;
  height: 100%;
  width: 100%;
}
#app {
  height: 100%;
  width: 100%;
}
</style>
