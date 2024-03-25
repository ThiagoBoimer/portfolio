<script setup lang="ts">
  import { ref } from 'vue';
  import Carousel from 'primevue/carousel';

  const products = ref([
    { 
      image: 'images/project-residuose.png', 
      name: 'Residuose', 
      description: 'This application has the goal of providing a match mechanism to help companies seeking for alternative raw materials based on waste in Santa Catarina, Brazil. Data of waste generators was collected from open databases and curated to achieve the objective of the app.',
      github_url: 'https://github.com/ThiagoBoimer/residuose/',
      app_url: 'https://residuose.tech/'
    },
    { 
      image: '@/assets/images/project-residuose.png', 
      name: 'Upcoming', 
      description: 'Upcoming' 
    },
    { 
      image: '@/assets/images/project-residuose.png', 
      name: 'Upcoming', 
      description: 'Upcoming'
    },
    { 
      image: '@/assets/images/project-residuose.png', 
      name: 'Upcoming', 
      description: 'Upcoming' 
    }
  ]);

  const responsiveOptions = ref([
    {
        breakpoint: '1400px',
        numVisible: 3,
        numScroll: 1
    },
    {
        breakpoint: '1199px',
        numVisible: 3,
        numScroll: 1
    },
    {
        breakpoint: '767px',
        numVisible: 1,
        numScroll: 1
    },
    {
        breakpoint: '575px',
        numVisible: 1,
        numScroll: 1
    }
  ]);

</script>

<template>

  <div class="projects" >
    <Carousel :value="products" :numVisible="3" :numScroll="1" :responsiveOptions="responsiveOptions" circular>
        <template #item="slotProps">
            <div style=" margin-right: 1rem; background-color: var(--surface-card); border-radius: var(--border-radius); border-color: var(--surface-border); border-width: 1px; border-style: solid; ">
                <div class="relative mx-auto">
                    <img :src="slotProps.data.image" :alt="slotProps.data.name" class="w-full border-round" width="100%"/>
                </div>
                <h1 style="margin-left: 1rem;">{{ slotProps.data.name }}</h1>
                <div style="font-size: 16px; margin-left: 1rem; padding-right: 1rem;">
                  {{ slotProps.data.description }}
                </div>
                <div class="links" style="">
                  <a :href="slotProps.data.app_url" target="_blank">Website</a>
                  <a :href="slotProps.data.github_url" target="_blank">Github repo</a>
                </div>
            </div>
        </template>
    </Carousel>
  </div>
</template>

<style lang="scss" scoped>

.links {
  margin: 2rem 1rem 2rem 1rem;
  display: flex;
  justify-content: space-around;
}

.links a {
  text-decoration: none;
  font-weight: bold;
  color: var(--primary-color)
}

.projects {
  margin-top: 3rem;
  background-color: var(--surface-ground);
  border-radius: 2rem; 
}

@media (min-width: 1024px) {
  .projects {
    margin-top: 3rem;
    background-color: var(--surface-ground);
    border-radius: 2rem;  
  }
  
}
</style>
