<script setup lang="ts">
import { useResumeStore } from '@/stores/resume'

const resumeStore = useResumeStore()
</script>

<template>
  <div class="flex flex-col items-center space-y-4">
    <div class="flex space-x-2 text-5xl md:text-8xl">
      <h1 class="font-thin">{{ resumeStore.getHeader.firstName }}</h1>
      <h1 class="font-bold">{{ resumeStore.getHeader.lastName }}</h1>
    </div>
    <p
      class="text-center text-xl md:text-4xl"
      :style="{
        color: resumeStore.getStyles.color ? resumeStore.getStyles.color : 'rgb(220 38 38)'
      }"
    >
      {{ resumeStore.getHeader.title }}
    </p>
    <p class="italic text-gray-600 text-center">
      {{ resumeStore.getHeader.address }}
    </p>
    <!-- TODO: change how the social information rendering -->
    <div class="flex space-x-2 flex-col md:flex-row text-center">
      <p>{{ resumeStore.getHeader.phone }}</p>
      <span class="hidden md:inline">|</span>
      <p>{{ resumeStore.getHeader.email }}</p>
      <span class="hidden md:inline">|</span>
      <p>{{ resumeStore.getHeader.homepage }}</p>
      <span class="hidden md:inline">|</span>
      <p>{{ resumeStore.getHeader.github }}</p>
      <span class="hidden md:inline">|</span>
      <p>{{ resumeStore.getHeader.linkedin }}</p>
    </div>
    <p class="italic text-gray-600 text-center">
      {{ resumeStore.getHeader.quote }}
    </p>
  </div>
</template>

<style scoped></style>
