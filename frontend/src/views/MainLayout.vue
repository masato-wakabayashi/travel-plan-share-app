<script setup lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'

</script>

<template>
    <div>
        <Header />
        <main class="pt-20">
            <router-view />
        </main>
        <Footer />
    </div>
</template>