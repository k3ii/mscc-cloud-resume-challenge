<template lang="">
  <table
    class="table-auto w-full border-separate border-spacing-y-4 border-spacing-x-2 md:border-spacing-0"
  >
    <tbody>
      <tr v-for="item in items">
        <td class="text-left w-1/12">{{ item.date }}</td>
        <td class="text-left font-bold w-3/12">{{ item.title }}</td>
        <td class="text-left w-6/12">{{ item.event }}</td>
        <td
          class="text-right italic w-2/12"
          :style="{
            color: resumeStore.getStyles.color ? resumeStore.getStyles.color : 'rgb(220 38 38)'
          }"
        >
          {{ item.location }}
        </td>
      </tr>
    </tbody>
  </table>
</template>
<script setup lang="ts">
import { useResumeStore } from '@/stores/resume'

const resumeStore = useResumeStore()

defineProps({
  items: Object
})
</script>
<style lang=""></style>
