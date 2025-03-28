<template>
    <header class="fixed top-0 left-0 w-full bg-white shadow-sm z-50">
        <div class="flex max-w-7xl mx-auto px-0 sm:px-2 lg:px-4 items-center justify-between h-16">
            <!-- 左：ロゴ  -->
            <router-link to="/home" class="text-lg sm:text-xl font-bold text-blue-600 hover:text-blue-700 flex items-center sm:pl-0">
                <img src="/compass.svg" alt="コンパスアイコン" class="w-6 h-6 sm:w-8 sm:h-8 mr-2">
                トラベルノート
            </router-link>

            <!-- 中央：ナビゲーションリンク (デスクトップ) -->
            <nav class="hidden md:flex space-x-4 lg:space-x-8">
                <router-link to="" class="text-gray-600 hover:text-blue-600 px-2 sm:px-3 py-2 rounded-md text-sm font-medium">マイ計画</router-link>
                <router-link to="" class="text-gray-600 hover:text-blue-600 px-2 sm:px-3 py-2 rounded-md text-sm font-medium">公開プラン</router-link>
                <router-link to="" class="text-gray-600 hover:text-blue-600 px-2 sm:px-3 py-2 rounded-md text-sm font-medium">プロフィール</router-link>
            </nav>

            <!-- モバイルメニューボタン -->
            <button 
                @click="isOpen = !isOpen"
                class="md:hidden p-2 rounded-md text-gray-600 hover:text-blue-600 hover:bg-gray-100"
            >
                <svg 
                    class="h-6 w-6" 
                    fill="none" 
                    viewBox="0 0 24 24" 
                    stroke="currentColor"
                >
                    <path 
                        v-if="!isOpen"
                        stroke-linecap="round" 
                        stroke-linejoin="round" 
                        stroke-width="2" 
                        d="M4 6h16M4 12h16M4 18h16"
                    />
                    <path 
                        v-else
                        stroke-linecap="round" 
                        stroke-linejoin="round" 
                        stroke-width="2" 
                        d="M6 18L18 6M6 6l12 12"
                    />
                </svg>
            </button>

            <!-- 右：ログアウト -->
            <button class="hidden md:block bg-gray-100 hover:bg-gray-200 text-gray-700 px-3 sm:px-4 py-2 rounded-lg text-sm font-medium transition-colors duration-200">
                ログアウト
            </button>
        </div>

        <!-- モバイルメニュー -->
        <div 
            v-if="isOpen" 
            class="md:hidden"
        >
            <div class="px-2 pt-2 pb-3 space-y-1 bg-white border-t">
                <router-link 
                    to="" 
                    class="block px-3 py-2 rounded-md text-base font-medium text-gray-600 hover:text-blue-600 hover:bg-gray-100"
                >
                    マイ計画
                </router-link>
                <router-link 
                    to="" 
                    class="block px-3 py-2 rounded-md text-base font-medium text-gray-600 hover:text-blue-600 hover:bg-gray-100"
                >
                    公開プラン
                </router-link>
                <router-link 
                    to="" 
                    class="block px-3 py-2 rounded-md text-base font-medium text-gray-600 hover:text-blue-600 hover:bg-gray-100"
                >
                    プロフィール
                </router-link>
                <button 
                    class="w-full text-left px-3 py-2 rounded-md text-base font-medium text-gray-600 hover:text-blue-600 hover:bg-gray-100"
                >
                    ログアウト
                </button>
            </div>
        </div>
    </header>
</template>

<script setup lang="ts">
import { ref } from 'vue'

const isOpen = ref(false)

const toggleMenu = () => {
  isOpen.value = !isOpen.value
}

</script>