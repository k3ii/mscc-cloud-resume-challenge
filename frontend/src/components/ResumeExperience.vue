<script setup lang="ts"></script>

<template>
  <div>
    <h2 class="text-3xl font-bold">Work Experience</h2>
    <div class="flex-grow border-b-2 border-gray-500"></div>
    <div class="space-y-3">
      <div>
        <div class="flex justify-between">
          <h3 class="text-xl font-bold">Omnious. Co., Ltd.</h3>
          <p class="italic text-red-600">Seoul, S.Korea</p>
        </div>
        <div class="flex justify-between">
          <p class="uppercase">Software Architect</p>
          <p class="text-gray-600 italic">Jun. 2017 - May. 2018</p>
        </div>
        <ul class="list-disc list-inside">
          <li>
            Provisioned an easily managable hybrid infrastructure(Amazon AWS + On-premise) utilizing
            IaC(Infrastructure as Code) tools like Ansible, Packer and Terraform.
          </li>
          <li>
            Built fully automated CI/CD pipelines on CircleCI for containerized applications using
            Docker, AWS ECR and Rancher.
          </li>
          <li>
            Designed an overall service architecture and pipelines of the Machine Learning based
            Fashion Tagging API SaaS product with the micro‑services architecture.
          </li>
        </ul>
      </div>
      <div>
        <div class="flex justify-between">
          <h3 class="text-xl font-bold">PLAT Corp.</h3>
          <p class="italic text-red-600">Seoul, S.Korea</p>
        </div>
        <div class="flex justify-between">
          <p class="uppercase">Co‑Founder & Software Engineer</p>
          <p class="text-gray-600 italic">Jan. 2016 - Jun. 2017</p>
        </div>
        <ul class="list-disc list-inside">
          <li>
            Implemented RESTful API server for car rental booking application(CARPLAT in Google
            Play).
          </li>
          <li>
            Built and deployed overall service infrastructure utilizing Docker container, CircleCI,
            and several AWS stack(Including EC2, ECS, Route 53, S3, CloudFront, RDS, ElastiCache,
            IAM), focusing on high-availability, fault tolerance, and auto-scaling.
          </li>
          <li>
            Developed an easy-to-use Payment module which connects to major PG(Payment Gateway)
            companies in Korea.
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<style scoped></style>
