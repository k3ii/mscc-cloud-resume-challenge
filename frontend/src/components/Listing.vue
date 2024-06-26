<template lang="">
  <div class="space-y-3">
    <div v-for="item in items">
      <div class="flex justify-between flex-col md:flex-row">
        <h3 class="text-xl font-bold">{{ item.company }}</h3>
        <p class="italic text-red-600">{{ item.location }}</p>
      </div>
      <div class="flex justify-between flex-col md:flex-row mb-2">
        <p class="uppercase">{{ item.title }}</p>
        <p class="text-gray-600 italic" v-if="item.endDate">
          {{ item.startDate }} - {{ item.endDate }}
        </p>
        <p class="text-gray-600 italic" v-else>{{ item.startDate }} - Present</p>
      </div>
      <ul class="list-disc list-inside">
        <li v-for="responsibility in item.responsibilities">
          {{ responsibility }}
        </li>
      </ul>
    </div>
  </div>
</template>
<script setup lang="ts">
defineProps({
  items: Object
})
</script>
<style lang=""></style>
