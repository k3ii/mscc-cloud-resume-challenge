<script setup lang="ts">
import { useResumeStore } from '@/stores/resume'

import subheader from '@/components/SubHeader.vue'
import listing from '@/components/Listing.vue'

const resumeStore = useResumeStore()
</script>

<template>
  <div>
    <subheader subheader="Writing" />
    <listing :items="resumeStore.getWriting" />
  </div>
</template>

<style scoped></style>
