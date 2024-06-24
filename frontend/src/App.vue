<script setup lang="ts">
import ResumeHeader from './components/ResumeHeader.vue'
import ResumeSummary from './components/ResumeSummary.vue'
import ResumeExperience from './components/ResumeExperience.vue'
import ResumeHonors from './components/ResumeHonors.vue'
import ResumePresentation from './components/ResumePresentation.vue'
import ResumeWriting from './components/ResumeWriting.vue'
import ResumeCommittee from './components/ResumeCommittees.vue'
import ResumeEducation from './components/ResumeEducation.vue'
import ResumeExtracurricular from './components/ResumeExtracurricular.vue'
import ResumeFooter from './components/ResumeFooter.vue'
</script>

<template>
  <div id="app" class="my-8 mx-24 space-y-4">
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
