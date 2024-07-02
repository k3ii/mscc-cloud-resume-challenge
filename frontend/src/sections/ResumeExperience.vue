<script setup lang="ts">
import { useResumeStore } from '@/stores/resume'

import subheader from '@/components/SubHeader.vue'
import listing from '@/components/Listing.vue'

const resumeStore = useResumeStore()
</script>

<template>
  <div>
    <subheader subheader="Experience" />
    <listing :items="resumeStore.getExperience" />
  </div>
</template>

<style scoped></style>
