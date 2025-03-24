import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import './assets/tailwind.css' // ← ✅ ここがTailwindを有効にする1行！

// import router from './router'

const app = createApp(App)

app.use(createPinia())
// app.use(router)

app.mount('#app')
