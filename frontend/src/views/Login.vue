<script setup lang="ts">
import { ref } from 'vue'

interface FormValues {
  email: string
  password: string
}

interface FormErrors {
  email?: string
  password?: string
}

const values = ref<FormValues>({
  email: '',
  password: ''
})

const errors = ref<FormErrors>({})

const validateEmail = (email: string): string | undefined => {
  if (!email) return 'メールアドレスを入力してください'
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
    return '有効なメールアドレスを入力してください'
  }
}

const validatePassword = (password: string): string | undefined => {
  if (!password) return 'パスワードを入力してください'
  if (password.length < 8) return 'パスワードは8文字以上です'
  if (!/[a-zA-Z]/.test(password)) return '英字を含めてください'
  if (!/[0-9]/.test(password)) return '数字を含めてください'
}

const validate = (): boolean => {
  const newErrors: FormErrors = {}
  
  const emailError = validateEmail(values.value.email)
  if (emailError) newErrors.email = emailError

  const passwordError = validatePassword(values.value.password)
  if (passwordError) newErrors.password = passwordError

  errors.value = newErrors
  return Object.keys(newErrors).length === 0
}

const onSubmit = async (e: Event) => {
  // 画面更新をしない
  e.preventDefault()

  if (validate()) {
    try {
      const response = await fetch('http://localhost:3001/api/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          email: values.value.email,
          password: values.value.password
        })
      })

      if (!response.ok) {
        throw new Error('ログインに失敗しました')
      }

      const data = await response.json()
      console.log('ログイン成功', data)
      
    } catch (error) {
      console.error('ログインエラー:', error)
    }
  }
}

</script>

<template>
  <div class="flex flex-col justify-center items-center min-h-screen bg-gray-50">
    <div class="text-center mb-8">
      <img src="/compass.svg" alt="コンパスアイコン" class="inline-block w-16 h-16 mb-4">
      <h1 class="text-2xl pb-2">おかえりなさい</h1>
      <p>アカウントにログインしてください</p>
    </div>

    <form
      @submit="onSubmit"
      class="w-full max-w-md border border-gray-300 rounded-t-lg p-6 bg-white"
    >
      <div class="mb-4">
        <label for="email" class="block mb-2">メールアドレス</label>
        <input
          type="email"
          v-model="values.email"
          id="email"
          placeholder="example@email.com"
          class="w-full border border-gray-300 rounded-lg py-1.5 px-3 bg-gray-50 focus:bg-white"
        />
        <p v-if="errors.email" class="text-red-500 text-sm mt-1">{{ errors.email }}</p>
      </div>

      <div class="mb-6">
        <label for="password" class="block mb-2">パスワード</label>
        <input
          type="password"
          v-model="values.password"
          id="password"
          class="w-full border border-gray-300 rounded-lg py-1.5 px-3 bg-gray-50 focus:bg-white"
        />
        <p v-if="errors.password" class="text-red-500 text-sm mt-1">{{ errors.password }}</p>
      </div>

      <button
        type="submit"
        class="w-full bg-blue-400 text-white rounded-lg py-2 cursor-pointer hover:bg-blue-500"
      >
        ログイン
      </button>
    </form>

    <div class="w-full max-w-md bg-white border border-t-0 border-gray-300 rounded-b-lg py-4">
      <p class="w-full text-center text-gray-600">
        アカウントをお持ちでないですか？
        <router-link to="/register" class="text-blue-600 hover:underline">アカウント作成</router-link>
      </p>
    </div>
  </div>
</template>
