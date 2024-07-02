<script setup lang="ts">
import { useResumeStore } from '@/stores/resume'

import ResumeHeader from './sections/ResumeHeader.vue'
import ResumeSummary from './sections/ResumeSummary.vue'
import ResumeExperience from './sections/ResumeExperience.vue'
import ResumeHonors from './sections/ResumeHonors.vue'
import ResumePresentation from './sections/ResumePresentation.vue'
import ResumeWriting from './sections/ResumeWriting.vue'
import ResumeCommittee from './sections/ResumeCommittees.vue'
import ResumeEducation from './sections/ResumeEducation.vue'
import ResumeExtracurricular from './sections/ResumeExtracurricular.vue'
import ResumeFooter from './sections/ResumeFooter.vue'

const resumeStore = useResumeStore()
</script>

<template>
  <div
    id="app"
    class="py-8 px-6 md:px-24 space-y-4"
    :style="{ 'font-family': resumeStore.getStyles.fontFamily }"
  >
    <ResumeHeader />
    <ResumeSummary />
    <ResumeExperience />
    <ResumeHonors />
    <ResumePresentation />
    <ResumeWriting />
    <ResumeCommittee />
    <ResumeEducation />
    <ResumeExtracurricular />
    <ResumeFooter />
  </div>
</template>

<style scoped></style>
