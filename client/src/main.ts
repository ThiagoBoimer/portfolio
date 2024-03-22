import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'

import PrimeVue from 'primevue/config';
import 'primeicons/primeicons.css'
import Tooltip from 'primevue/tooltip';

const app = createApp(App)

app.use(createPinia())
app.use(router)
app.use(PrimeVue);
app.directive('tooltip', Tooltip);

app.mount('#app')
