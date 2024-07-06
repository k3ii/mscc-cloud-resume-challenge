<template lang="">
  <table
    class="table-auto w-full border-separate border-spacing-y-2 md:border-spacing-y-0 border-spacing-x-2 md:border-spacing-x-5"
  >
    <tbody>
      <tr v-for="item in items" :key="item.key">
        <td
          class="w-1/2 lg:w-2/6 text-right font-bold overflow-hidden whitespace-nowrap text-ellipsis max-w-2 lg:max-w-xs"
        >
          {{ item.key }}
        </td>
        <td
          class="w-1/2 lg:w-4/6 text-left italic overflow-hidden whitespace-nowrap text-ellipsis max-w-2 lg:max-w-xs"
        >
          {{ item.value }}
        </td>
      </tr>
    </tbody>
  </table>
</template>

<script setup lang="ts">
const props = defineProps({
  items: {
    type: Array as () => { key: string; value: string }[],
    required: true
  }
})
</script>

<style lang=""></style>
