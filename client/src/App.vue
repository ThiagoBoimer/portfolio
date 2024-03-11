<script setup lang="ts">

import { ref } from 'vue';
import HelloWorld from './components/HelloWorld.vue'
import TabMenu from 'primevue/tabmenu';

const items = ref([
  { label: 'Home', route: '/', icon: 'pi pi-home' },
  { label: 'About', route: 'about', icon: 'pi pi-info-circle' },
  // Add more items as needed
]);

</script>

<template>
  <div>
    <img alt="Vue logo" class="logo" src="@/assets/logo.svg" width="125" height="125" />
    <span class="logo">Thiago <br> Boimer</span>

    <div class="wrapper">
      <TabMenu :model="items">
        <template #item="{ item, props }">
          <router-link v-if="item.route" v-slot="{ href, navigate }" :to="item.route" custom>
            <a v-ripple :href="href" v-bind="props.action" @click="navigate">
                <span v-bind="props.icon" />
                <span v-bind="props.label">{{ item.label }}</span>
            </a>
        </router-link>
        </template>
      </TabMenu>
    </div>

    <router-view />
  </div>
</template>

<style scoped>

.logo {
  display: block;
  margin: 0 auto 2rem;
}

.wrapper {
  width: 100%;
  max-width: 70rem;
  font-size: 12px;
  text-align: center;
  margin-top: 2rem;
}

.wrapper a.router-link-exact-active {
  color: var(--color-text);
}

.wrapper a.router-link-exact-active:hover {
  background-color: transparent;
}

.wrapper a {
  display: inline-block;
  padding: 0 1rem;
  border-left: 1px solid var(--color-border);
}

.wrapper a:first-of-type {
  border: 0;
}

@media (min-width: 1024px) {
  header {
    display: flex;
    place-items: center;
    padding-right: calc(var(--section-gap) / 2);
  }

  .logo {
    margin: 6rem 2rem 0 5rem;
  }

  .wrapper {
    text-align: left;
    margin-left: 5rem;
    font-size: 1rem;

    padding: 1rem 0;
    margin-top: 1rem;
  }
}
</style>