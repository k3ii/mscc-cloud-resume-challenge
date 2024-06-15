<script setup lang="ts"></script>

<template>
  <div>
    <h2 class="text-2xl font-bold">Work Experience</h2>
    <div>
      <h3 class="text-xl font-bold">Omnious. Co., Ltd.</h3>
      <p>Seoul, S.Korea</p>
      <p>Software Architect</p>
      <p>Jun. 2017 - May. 2018</p>
      <ul role="list">
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
      <h3 class="text-xl font-bold">PLAT Corp.</h3>
      <p>Seoul, S.Korea</p>
      <p>Co‑Founder & Software Engineer</p>
      <p>Jan. 2016 - Jun. 2017</p>
      <ul role="list">
        <li>
          Implemented RESTful API server for car rental booking application(CARPLAT in Google Play).
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
</template>

<style scoped></style>
