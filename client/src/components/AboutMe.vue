<script setup lang="ts">
import { ref } from 'vue'
import Image from 'primevue/image';
import ProgressBar from 'primevue/progressbar';
import Tag from 'primevue/tag';
import Button from 'primevue/button';
import TypingEffect from './TypingEffect.vue';

const phrases = ref([
  "I'm Thiago",
  "I'm an engineer",
  "I'm a back-end developer",
  "I'm a curious mind!",
])

const levels = ref({
  'novice': {
    'tooltip': 'I understand some of the concepts and used a few tools, but complex stuff will likely slow me down',
    'percent': 35
  },
  'intermediate': {
    'tooltip': 'I get most of the concepts and can deliver any task with research and time',
    'percent': 70
  },
  'advanced': {
    'tooltip': 'I master this, I have used  ton of tools and know which one is the best for the situation',
    'percent': 90
  }
  
})

</script>

<template>
  <div class="card">
    <span class="intro">
      <Image src="images/me_cool.png" alt="Image" width="250" height="250" />
      <div>
        <div class="typing-effect">
          <TypingEffect :phrases="phrases"/>
        </div>
        <div class="bio">
          <p>I have 2+ years of work experience programming with Python</p>
          <ul>
            <li>
              My most recent position was as a backend developer / data engineer at <a href="https://dataforall.com.br/" target="_blank">DataforAll</a>
            </li>
            <li>
              I've also had a previous role as Systems Developer at <a href="https://scadahub.io/en/en-home/" target="_blank">Scadahub</a> where I worked a bit with SCADA software development
            </li>
          </ul>
          
          <p>Along the way, I’ve come to appreciate the significance of a workplace that fosters a culture of feedback, data-driven decision-making, transparency and equality without any form of discrimination.</p>
          
          <p>I love coding and I'm open to new work opportunities out there. If you want to know more, please download my resume below</p>
          <a href="docs/thiago_resume.pdf" download="thiago_resume.pdf"><Button style="font-size: 14px;" icon="pi pi-download" label="Resume" /></a>
        </div>
      </div>
    </span>
  </div>
  <div class="footer">
    <div class="skills card">
      <div class="header">
        <i class="pi pi-wrench"></i>
        <h2>Skills</h2>
      </div>
      <div class="progress-bar">
        <div class="skills-format">
          <p>Python</p>
          <ProgressBar v-tooltip.right="levels.intermediate.tooltip" :value="levels.intermediate.percent"></ProgressBar>
          <p>Javascript</p>
          <ProgressBar v-tooltip.right="levels.novice.tooltip" :value="levels.novice.percent"></ProgressBar>
          <p>Golang</p>
          <ProgressBar v-tooltip.right="levels.novice.tooltip" :value="levels.novice.percent"></ProgressBar>
        </div>
        <div class="skills-format">
          <p>Django</p>
          <ProgressBar v-tooltip.right="levels.intermediate.tooltip" :value="levels.intermediate.percent"></ProgressBar>
          <p>Flask</p>
          <ProgressBar v-tooltip.right="levels.intermediate.tooltip" :value="levels.intermediate.percent"></ProgressBar>
          <p>FastAPI</p>
          <ProgressBar v-tooltip.right="levels.intermediate.tooltip" :value="levels.intermediate.percent" ></ProgressBar>
        </div>
        <div class="skills-format">
          <p>SQL</p>
          <ProgressBar v-tooltip.right="levels.intermediate.tooltip" :value="levels.intermediate.percent"></ProgressBar>
          <p>NoSQL</p>
          <ProgressBar v-tooltip.right="levels.intermediate.tooltip" :value="levels.intermediate.percent"></ProgressBar>
          <p>ORM</p>
          <ProgressBar v-tooltip.right="levels.intermediate.tooltip" :value="levels.intermediate.percent"></ProgressBar>
        </div>
        <div class="skills-format">
          <p>Microservices</p>
          <ProgressBar v-tooltip.top="levels.novice.tooltip" :value="levels.novice.percent"></ProgressBar>
          <p>DevOps</p>
          <ProgressBar v-tooltip.top="levels.novice.tooltip" :value="levels.novice.percent"></ProgressBar>
          <p>Testing</p>
          <ProgressBar v-tooltip.top="levels.novice.tooltip" :value="levels.novice.percent"></ProgressBar>
        </div>
      </div>
    </div>
    <div class="experience card">
      <div class="header">
        <i class="pi pi-briefcase"></i>
        <h2>Last Experience</h2>
      </div>
      <div class="experience-format">
        <div class="experience-role">
          <p>
            Backend Engineer @ <a href="https://dataforall.com.br/" target="_blank">DataforAll</a>
          </p>
          <p>
            Nov 2022 – Feb 2024
          </p>
        </div>
        <div class="experience-tools">
          <p style="margin-top: 1px;">
            Tools
          </p>
          <Tag class="tags" value="Python" rounded></Tag>
          <Tag class="tags" value="Flask" rounded></Tag>
          <Tag class="tags" value="Docker" rounded></Tag>
          <Tag class="tags" value="Pandas" rounded></Tag>
          <Tag class="tags" value="Beam" rounded></Tag>
          <Tag class="tags" value="NiFi" rounded></Tag>
          <Tag class="tags" value="Pentaho" rounded></Tag>
          <Tag class="tags" value="Kafka" rounded></Tag>
          <Tag class="tags" value="AWS S3" rounded></Tag>
          <Tag class="tags" value="AWS EC2" rounded></Tag>
          <Tag class="tags" value="Docker" rounded></Tag>
          <Tag class="tags" value="MySQL" rounded></Tag>
          <Tag class="tags" value="PostgreSQL" rounded></Tag>
          <Tag class="tags" value="MongoDB" rounded></Tag>
        </div>
      </div>
    </div>
    <div class="education card">
      <div class="header">
        <i class="pi pi-book"></i>
        <h2>Education</h2>
      </div>
      <div class="education-format">
        <div class="education-role">
          <p>
            Materials Engineering @ <a href="https://en.ufsc.br/" target="_blank">UFSC</a>
          </p>
          <p>
            Mar 2019 – Dec 2023
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="curious">
    <a href="https://github.com/ThiagoBoimer/portfolio" target="_blank">curious on how I did this? Check my repo :)</a>
  </div>
</template>

<style lang="scss" scoped>

i {
  font-size: 1.0rem; 
  margin-left: 1rem; 
  margin-right: 1rem;
}

p {
  font-size: small;
}

.card {
  background-color: var(--surface-card); 
  border-radius: var(--border-radius); 
  border-color: var(--surface-border); 
  border-width: 1px; 
  border-style: solid; 
}

.footer {
  margin: 1rem auto 0 0;  
  display: flex;  
  flex-direction: row;
  align-items: stretch;
  width: 100%;
  height: 100%;
  justify-content: space-between; 
}

.footer .card {
  display: flex;
  height: 100%;
  align-items: center;
  width: 50%;
}

.footer a {
  text-decoration: solid;
  font-weight: bold;
}

.footer .skills-format {
  padding: 0rem 0 1rem 1rem; 
  width: 24%; 
  height: 100%;
}

.footer .skills {
  display: block;
  align-items: center;
  width: 33%;
  height: 100%;

}

.footer .skills .header {
  display: flex;
  align-items: center;
  width: 33%;
  padding: 0;
  margin: 0;
}

.footer .experience-format {
  padding: 0rem 0 1rem 1rem; 
  font-size: small;
  width: 100%; 
  height: 100%;
}

.footer .experience-format .experience-role {
  padding: 0rem 1rem 0rem 0rem; 
  width: 100%; 
  height: 100%;
  display: flex; 
  font-weight: bold;
  justify-content: space-between; 
}

.footer .experience-format .experience-tools {
  padding: 0rem 0rem 0rem 0rem; 
  width: 100%; 
  height: 100%;
  display: block; 
  font-weight: bold;
}

.footer .experience {
  display: block;
  align-items: center;
  width: 33%;
  height: 100%;
}

.footer .experience .header {
  display: flex;
  align-items: center;
  width: 50%;
  padding: 0;
  margin: 0;

}

.footer .experience .card {
  display: table;
  align-items: center;
  width: 33%;
  height: 100%;
}

.footer .education-format {
  padding: 0rem 0 1rem 1rem; 
  font-size: small;
  width: 100%; 
  height: 100%;
}

.footer .education-format .education-role {
  padding: 0rem 1rem 0rem 0rem; 
  width: 100%; 
  height: 100%;
  display: flex; 
  font-weight: bold;
  justify-content: space-between; 
}

.footer .education {
  display: block;
  align-items: center;
  width: 33%;
  height: 100%;
}

.footer .education .header {
  display: flex;
  align-items: center;
  width: 100%;
  padding: 0;
  margin: 0;

}

.footer .education .card {
  display: table;
  align-items: center;
  width: 33%;
  height: 100%;
}

.tags {
  margin-right: 0.5rem;
  margin-bottom: 0.5rem;
  font-weight: lighter;
  font-size: smaller;
}

.progress-bar {
  display: flex;
  align-items: center;
}

.intro {
  margin: 2rem 2rem 2rem 2rem; 
  display: flex; 
  align-items: start;
}

.bio {
  font-size: medium; 
  margin-left: 2rem;
}

.bio p {
  font-size: medium;
  margin-top: 0rem;
  margin-bottom: 0.6rem;
}

.bio a {
  text-decoration: solid;
}

h2 {
  font-size: 1.2rem;
  font-weight: normal;
  span.typed-text {
    color: var(--primary-color);
  }
}

.curious {
  font-size: 10px;
  font-style: italic;
  display: flex;
  align-items: center;
  align-content: center;
  justify-content: center;
  width: 100%;
  margin-top: 10px;
  color: rgb(128, 128, 128);
}

.curious a {
  text-decoration: none;
}

@media (max-width: 768px) {

  li {
    list-style-type: none;
  }

  .intro {
    flex-direction: column;
    align-items: center;
    text-align: center;
    margin: 1rem 1rem 1rem 1rem;
  }

  .intro .bio {
    margin-left: 0; 
    margin-top: 1rem; 
  }

  .footer {
    flex-direction: column; 
    align-items: center; 
    width: 100%;
    margin: 1rem 0 0 0;  
  }

  .footer .card {
    width: 100%; 
    height: 100%;
    margin-bottom: 1rem; 
  }

  .typing-effect {
    width: 100%;
  }

  .container {
    display: flex;
    align-items: center;
    justify-content: center;
    align-content: center;
    margin-left: 0;
  }
}

</style>