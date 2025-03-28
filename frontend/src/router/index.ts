import { createRouter, createWebHistory } from 'vue-router';
import type { RouteRecordRaw } from 'vue-router';

import MainLayout from '@/views/MainLayout.vue';
import Login from '@/views/Login.vue';
import Home from '@/views/Home.vue';

const routes: RouteRecordRaw[] = [
    {
        // アプリ起動時はログイン画面へ遷移
        path: '/',
        redirect: '/login'
    },
    {
        path: '/login',
        name: 'Login',
        component: Login
    },
    {
        path: '/',
        component: MainLayout,
        children: [
            { path: 'home', component: Home },
            // { path: 'plans/:id', component: PlanDetail }
        ],
    },
];

const router = createRouter({
    history: createWebHistory(),
    routes
});

export default router;