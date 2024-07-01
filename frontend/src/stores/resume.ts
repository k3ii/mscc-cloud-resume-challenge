import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

export const useResumeStore = defineStore('resume', () => {
  const styles= ref({ 
    color: '',
    fontFamily: ''
  })
  const header = ref({
    firstName: 'Byungjin',
    lastName: 'Park',
    title: 'Software Engineer · Security Expert',
    address: '42-8, Bangbae-ro 15-gil, Seocho-gu, Seoul, 00681, Rep. of KOREA',
    phone: '(+82) 10-1234-5678',
    email: 'posquit0.bj@gmail.com',
    homepage: 'www.posquit0.com',
    github: 'posquit0',
    linkedin: 'posquit0',
    quote: 'Be the change that you want to see in the world.'
  })
  const summary = ref('Current Site Reliability Engineer at start-up company Kasa. 7+ years experience specializing in the backend development, infrastructure automation, and computer hacking/security. Super nerd who loves Vim, Linux and OS X and enjoys to customize all of the development environment. Interested in devising a better problem-solving method for challenging tasks, and learning new technologies and tools if the need arises.')
  const experience = ref([
    {
      company: 'Omnious. Co., Ltd',
      location: 'Seoul, Korea',
      title: 'Software Architect',
      startDate: 'Jun. 2017',
      endDate: 'Present',
      responsibilities: [
        'Provisioned an easily managable hybrid infrastructure(Amazon AWS + On-premise) utilizing IaC(Infrastructure as Code) tools like Ansible, Packer and Terraform.',
        'Built fully automated CI/CD pipelines on CircleCI for containerized applications using Docker, AWS ECR and Rancher.',
        'Designed an overall service architecture and pipelines of the Machine Learning based Fashion Tagging API SaaS product with the micro‑services architecture.'
      ]
    },
    {
      company: 'PLAT Corp.',
      location: 'Seoul, Korea',
      title: 'Co-Founder & Software Engineer',
      startDate: 'Jan. 2016',
      endDate: 'May 2017',
      responsibilities: [
        'Implemented RESTful API server for car rental booking application(CARPLAT in Google Play).',
        'Built and deployed overall service infrastructure utilizing Docker container, CircleCI, and several AWS stack(Including EC2, ECS, Route 53, S3, CloudFront, RDS, ElastiCache, IAM), focusing on high-availability, fault tolerance, and auto-scaling.',
        'Developed an easy-to-use Payment module which connects to major PG(Payment Gateway) companies in Korea.'
      ]
    }])
  const honors = ref({
    international: [
      {
        title: 'Finalist',
        event: 'DEFCON 26th CTF Hacking Competition World Final',
        date: '2018',
        location: 'Las Vegas, U.S.A'
      },
      {
        title: 'Finalist',
        event: 'DEFCON 25th CTF Hacking Competition World Final',
        date: '2017',
        location: 'Las Vegas, U.S.A'
      },
      {
        title: 'Finalist',
        event: 'DEFCON 22nd CTF Hacking Competition World Final',
        date: '2014',
        location: 'Las Vegas, U.S.A'
      }
    ],
    domestic: [
      {
        title: '3rd Place',
        event: 'WITHCON Hacking Competition Final',
        date: '2015',
        location: 'Seoul, S.Korea'
      },
      {
        title: 'Silver Prize',
        event: 'KISA HDCON Hacking Competition Final',
        date: '2017',
        location: 'Seoul, S.Korea'
      },
      {
        title: 'Silver Prize',
        event: 'KISA HDCON Hacking Competition Final',
        date: '2013',
        location: 'Seoul, S.Korea'
      }
    ]
  })
  const presentation = ref([
    {
      company: 'DevFest Seoul by Google Developer Group Korea',
      location: 'Seoul, S.Korea',
      title:'Presenter for Hosting Web Application for Free utilizing GitHub, Netlify and CloudFlare',
      startDate: 'Jun. 2017', 
      endDate: 'May. 2018',
      responsibilities: [
        'Introduced the history of web technology and the JAM stack which is for the modern web application development.',
        'Introduced how to freely host the web application with high performance utilizing global CDN services.'
      ]
    },
    {
      company: '6th CodeEngn (Reverse Engineering Conference)',
      location: 'Seoul, S.Korea',
      title: 'Presenter for DEFCON 20th : The way to go to Las Vegas',
      startDate: 'Jul. 2012',
      endDate: '',
      responsibilities: [
        'Introduced CTF(Capture the Flag) hacking competition and advanced techniques and strategy for CTF'
      ]
    }
  ])
  const writing = ref([
    {
      company: 'A Guide for Developers in Start‑up',
      location: 'Facebook Page',
      title: 'PFOUNDER & WRiTER',
      startDate: 'Jan. 2015',
      endDate: '',
      responsibilities: [
        'Drafted daily news for developers in Korea about IT technologies, issues about start‑up.'
      ]
    }
  ])
  const committee = ref([
      {
        title: 'Problem Writer',
        event: '2016 CODEGATE Hacking Competition World Final',
        date: '2016',
        location: 'Seoul, S.Korea'
      },
      {
        title: 'Organizer & Co-director',
        event: '1st POSTECH Hackathon',
        date: '2013',
        location: 'Seoul, S.Korea'
      },
    ]
  )
  const education = ref([
    {
      company: 'POSTECH (Pohang University of Science and Technology)',
      location: 'Pohang, S.Korea',
      title:'B.S. iN COMPUTER SCiENCE AND ENGiNEERiNG',
      startDate: 'Mar. 2010', 
      endDate: 'Aug. 2017',
      responsibilities: [
        'Got a Chun Shin‑Il Scholarship which is given to promising students in CSE Dept.',
      ]
    },
  ])
  const extracurricular  = ref([
    {
      company: 'PoApper (Developers\' Network of POSTECH)',
      location: 'Pohang, S.Korea',
      title:'Core Member & President at 2013',
      startDate: 'Jun. 2010', 
      endDate: 'Jun. 2017',
      responsibilities: [
        'Reformed the society focusing on software engineering and building network on and off campus.',
        'Proposed various marketing and network activities to raise awareness.',      
      ]
    },
    {
      company: 'PLUS (Laboratory for UNIX Security in POSTECH)',
      location: 'Pohang, S.Korea',
      title:'Member',
      startDate: 'Sep. 2010', 
      endDate: 'Oct. 2011',
      responsibilities: [
        'Gained expertise in hacking \& security areas, especially about internal of operating system based on UNIX and several exploit techniques.',
        'Participated on several hacking competition and won a good award.',
        'Conducted periodic security checks on overall IT system as a member of POSTECH CERT.',
        'Conducted penetration testing commissioned by national agency and corporation.'
      ]
    }
  ])

  const getStyles = computed(() => styles.value)
  const getHeader = computed(() => header.value)
  const getSummary = computed(() => summary.value)
  const getExperience = computed(() => experience.value)
  const getHonors = computed(() => honors.value)
  const getPresentations = computed(() => presentation.value)
  const getWriting = computed(() => writing.value)
  const getCommittees = computed(() => committee.value)
  const getEducation = computed(() => education.value)
  const getExtracurricular = computed(() => extracurricular.value)

  return {
    getStyles,
    getHeader,
    getSummary,
    getExperience,
    getHonors,
    getPresentations,
    getWriting,
    getCommittees,
    getEducation,
    getExtracurricular,
  }
})
