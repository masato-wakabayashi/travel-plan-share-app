# travel-plan-share-app
## 開発前提
| 項目         | 内容                                      | 備考                         |
|--------------|-------------------------------------------|------------------------------|
| フロントエンド | Vue.js（TypeScript、Pinia、Vue Router）   | Viteベース、Tailwind導入予定 |
| バックエンド   | Node.js（Express）                        | REST API構成予定             |
| データベース   | MySQL（Prisma）                           |                             |
| インフラ       | Docker(予定)、Vercel、Render              | ローカル＆本番共通意識       |
| CI/CD        | GitHub Actions(予定)                      | Lint → Build → Deploy順      |
| ソース管理    | GitHub                                    | Issueテンプレート使用         |


## フォルダ構成
```
trip-share-app/
├── frontend/                      # フロントエンド（Vue + TypeScript + Vite）
│   ├── public/
│   ├── src/
│   │   ├── assets/
│   │   ├── components/
│   │   ├── pages/                # 画面単位で分ける場合
│   │   ├── router/               # Vue Router設定
│   │   ├── store/                # Piniaなど状態管理
│   │   └── App.vue
│   ├── index.html
│   ├── vite.config.ts
│   ├── tsconfig.json
│   ├── .env                      # フロントエンド環境変数（APIのURLなど）
│   └── package.json
│
├── backend/                      # バックエンド（Express + Prisma + MySQL）
│   ├── prisma/
│   │   └── schema.prisma
│   ├── src/
│   │   └── index.ts             # エントリーポイント
│   ├── .env                     # MySQLの接続情報など
│   ├── package.json
│   ├── tsconfig.json
│   └── README.md                # API仕様などを記述（任意）
│
├── .gitignore                   # 共通のGit無視設定
├── README.md                   # プロジェクト全体の説明

```

## 🛠️ ローカル開発環境 セットアップ手順
### 1. GitHub リポジトリ作成（trip-share-app）
```
mkdir trip-share-app && cd trip-share-app
git init
```

### 2. フロントエンドセットアップ（Vue + Vite）
```
npm create vue@latest frontend
cd frontend
npm install
npm run dev
```
- TypeScript ✅
- Vue Router ✅
- Pinia ✅
- ESLint/Prettier ✅

### 3. バックエンドセットアップ（Express + Prisma）
```
cd ../
mkdir backend && cd backend
npm init -y
npm install express cors dotenv
npm install --save-dev typescript ts-node @types/node @types/express @types/cors
```
tsconfig.json を作成
```
npx tsc --init
```
作成された tsconfig.json を以下のように最適化：
```
{
  "compilerOptions": {
    "target": "ES2020",
    "module": "CommonJS",
    "rootDir": "src",
    "outDir": "dist",
    "strict": true,
    "esModuleInterop": true,
    "forceConsistentCasingInFileNames": true,
    "skipLibCheck": true
  },
  "include": ["src"]
}
```


### 4. MySQL + Prisma セットアップ
```
npm install prisma --save-dev
npx prisma init --datasource-provider mysql
```
prisma/schema.prisma
```
generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider = "mysql"
  url      = env("DATABASE_URL")
}

// テスト用テーブル
model User {
  id    Int    @id @default(autoincrement())
  name  String
  email String @unique
}
```
.env
```
DATABASE_URL="mysql://xxxxx:xxxxx@xxxxx/xxxxx"
PORT=3001
```
```
npx prisma generate
npx prisma db push
```

###  5. 起動スクリプトの追加（package.json）
```
"scripts": {
  "dev": "ts-node src/index.ts",
  "build": "tsc",
  "start": "node dist/index.js"
}
```



