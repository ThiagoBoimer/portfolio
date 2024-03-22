<script setup lang="ts">

import { ref } from 'vue';
import { usePrimeVue } from 'primevue/config';
import Menubar from 'primevue/menubar';

// Router Paths
const paths = ref([
  { label: 'about me', route: '/', icon: 'pi pi-user' },
  { label: 'projects', route: 'projects', icon: 'pi pi-folder' },
]);

// Set default theme folder-name to currentTheme (theme must be on public/themes)
const currentTheme = ref('mdc-dark-deeppurple'); 

// Gets primevue config
const PrimeVue = usePrimeVue();

// Theme handler
function toggleTheme () {
    
    // Handle current and next theme
    let nextTheme = 'mdc-light-deeppurple';
    var currentIcon = document.getElementById("theme-icon");
    if (currentTheme.value === 'mdc-dark-deeppurple') {
      nextTheme = 'mdc-light-deeppurple';
      currentIcon!.className = "pi pi-moon";

    } else if (currentTheme.value === 'mdc-light-deeppurple') {
      nextTheme = 'mdc-dark-deeppurple';
      currentIcon!.className = "pi pi-sun";
    }

    // Call primevue changeTheme function (it will change the href in index.html file) 
    PrimeVue.changeTheme(currentTheme.value, nextTheme, 'theme-link', () => {});    

    // Update current theme
    currentTheme.value = nextTheme;
}

</script>

<template>
  <div class="wrapper">
    <Menubar :model="paths">
      <template #start></template>
      <template #item="{ item, props }">
        <router-link v-if="item.route" v-slot="{ href, navigate }" :to="item.route" :exact="true">
          <a :href="href" v-bind="props.action" @click="navigate" >
              <span v-bind="props.icon" />
              <span v-bind="props.label">{{ item.label }}</span>
          </a>
        </router-link>
      </template>
      <template #end>
        <div class="links">
          <button @click="toggleTheme()"><i id="theme-icon" class="pi pi-sun" style="font-size: 1.2rem; margin-right: 2rem; color: var(--primary-color);"></i></button>
          <a href="https://github.com/ThiagoBoimer" target="_blank"><i class="pi pi-github" style="font-size: 1.6rem; margin-right: 1rem"></i></a>
          <a href="https://www.linkedin.com/in/thiagoboimer/" target="_blank"><i class="pi pi-linkedin" style="font-size: 1.6rem"></i></a>
        </div>
      </template>
    </Menubar>
    <router-view />
  </div>

</template>

<style scoped>

button {
  border: none;
  outline: none;
  background-color: transparent; 
  padding: 0; 
  margin: 0; 
  cursor: pointer;
}

a {
  text-decoration: none;
  font-weight: bold;
}

.router-link-exact-active .p-menuitem-text {
  color: var(--primary-color);
  text-decoration: none;
  
}

.router-link-exact-active .p-menuitem-icon {
  color: var(--primary-color);
}

.wrapper {
  font-size: 16px;
  margin-top: 1rem;
  width: 100%;
  height: auto;
}

.links {
  margin-right: 2rem;
  display: flex;
  align-items: center;
}

@media (min-width: 768px) {

  .wrapper {
    text-align: left;
    font-size: 14rem;
    margin-top: 1rem;
  }
}

</style>