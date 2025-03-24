# travel-plan-share-app
## 開発前提
---
| 項目         | 内容                                      | 備考                         |
|--------------|-------------------------------------------|------------------------------|
| フロントエンド | Vue.js（TypeScript、Pinia、Vue Router）   | Viteベース、Tailwind導入予定 |
| バックエンド   | Node.js（Express）                        | REST API構成予定             |
| データベース   | PlanetScale（Prisma）                     | MySQL互換、開発ブランチ使用   |
| インフラ       | Docker、Vercel、Render                    | ローカル＆本番共通意識       |
| CI/CD        | GitHub Actions                            | Lint → Build → Deploy順      |
| ソース管理    | GitHub                                    | Issueテンプレート使用         |

## フォルダ構成
```
trip-share-app/
├── frontend/        # Vue.js（Vite）
├── backend/         # Node.js + Express + Prisma
├── prisma/          # Prismaのスキーマ定義（共通化）
├── .env.frontend    # フロント用環境変数
├── .env.backend     # バックエンド用環境変数（PlanetScale含む）
├── .gitignore
└── README.md
```
