<script setup lang="ts">
import { useResumeStore } from '@/stores/resume'
import { onBeforeMount } from 'vue'

import ResumeVisitorCounter from './sections/ResumeVisitorCounter.vue'
import ResumeHeader from './sections/ResumeHeader.vue'
import ResumeSummary from './sections/ResumeSummary.vue'
import ResumeExperience from './sections/ResumeExperience.vue'
import ResumeHonors from './sections/ResumeHonors.vue'
import ResumePresentation from './sections/ResumePresentation.vue'
import ResumeWriting from './sections/ResumeWriting.vue'
import ResumeCommittee from './sections/ResumeCommittees.vue'
import ResumeSkills from './sections/ResumeSkills.vue'
import ResumeEducation from './sections/ResumeEducation.vue'
import ResumeExtracurricular from './sections/ResumeExtracurricular.vue'
import ResumeFooter from './sections/ResumeFooter.vue'

const resumeStore = useResumeStore()

onBeforeMount(() => {
  if (performance.navigation.type == performance.navigation.TYPE_RELOAD) {
    resumeStore.setVisitorCount()
  } else {
    resumeStore.updateVisitorCount()
  }
})
</script>

<template>
  <div v-if="resumeStore.getVisitorCount === 0">
    <div
      class="grid h-screen w-screen bg-white content-center justify-items-center"
      v-if="resumeStore.getStyles.loadingScreen.imageUrl"
    >
      <img :src="resumeStore.getStyles.loadingScreen.imageUrl" />
      <span class="blink_me text-3xl md:text-4xl text-center">{{
        resumeStore.getStyles.loadingScreen.text
          ? resumeStore.getStyles.loadingScreen.text
          : 'Loading...'
      }}</span>
    </div>
    <div
      class="grid h-screen w-screen bg-white content-center justify-items-center"
      v-else-if="!resumeStore.getStyles.loadingScreen.imageUrl"
    >
      <span class="blink_me text-3xl md:text-8xl">Loading...</span>
    </div>
  </div>

  <div
    class="py-8 px-6 md:px-24 space-y-4 w-full md:w-5/6 bg-white md:m-4 shadow-lg md:text-2xl"
    :style="{ 'font-family': resumeStore.getStyles.fontFamily }"
    v-else
  >
    <ResumeVisitorCounter />
    <ResumeHeader />
    <ResumeSummary />
    <ResumeExperience />
    <ResumeHonors />
    <ResumePresentation />
    <ResumeWriting />
    <ResumeCommittee />
    <ResumeSkills />
    <ResumeEducation />
    <ResumeExtracurricular />
    <ResumeFooter />
  </div>
</template>

<style scoped>
.blink_me {
  animation: blinker 1s linear infinite;
}

@keyframes blinker {
  50% {
    opacity: 0;
  }
}
</style>
