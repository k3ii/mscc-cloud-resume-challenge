<script setup lang="ts">
import { useResumeStore } from '@/stores/resume'

import subheader from '@/components/SubHeader.vue'
import listing from '@/components/Listing.vue'

const resumeStore = useResumeStore()
</script>

<template>
  <div>
    <subheader subheader="Education" />
    <listing :items="resumeStore.getEducation" />
  </div>
</template>

<style scoped></style>
