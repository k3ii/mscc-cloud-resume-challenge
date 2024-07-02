<script setup lang="ts">
import { useResumeStore } from '@/stores/resume'

import subheader from '@/components/SubHeader.vue'
import listing from '@/components/Listing.vue'

const resumeStore = useResumeStore()
</script>

<template>
  <div>
    <subheader subheader="Extracurricular" />
    <listing :items="resumeStore.getExtracurricular" />
  </div>
</template>

<style scoped></style>
