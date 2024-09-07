# BetaMaster💡
**「確定ポイント」で学ぶベタ問題特化型クイズアプリ『BetaMaster』**
<img width="700" src="https://github.com/user-attachments/assets/643bff65-8033-4750-997b-32f07d82d84f">
　　　
## アプリURL🔗
https://beta-master.net
　
## 要求定義書📝
https://fate-clementine-8c5.notion.site/_-_v2-0-a9a39fa9c74647beb31f6db453549b33?pvs=4
　
## ここでクイズです🧑‍🏫
***「問題、フランス語で『稲妻』という意味がある、細長いシュークリームにチョコレートをかけた洋菓子は何でしょう？」「答え：エクレア」***

問題文を全て見ることができれば誰でも回答することができるでしょう。しかし競技クイズでは早押しボタンを押すスピードが命です。そのため、答えをいかに速く推測するか、つまり「確定させるか」が肝になります。

先程のクイズで言うと、***「問題、フランス語で『稲…」*** までで「エクレア」に辿り着けるのが理想です。この答えを完全に推測できる位置を **「確定ポイント」** と言います。

また競技クイズにはよく出題されがちな問題、つまり **「ベタ問題」** が多く存在します。競技クイズ初心者はベタ問題をまずは地道に覚えていくことでレベルアップを図ることができます。

今回はこの「ベタ問題」の「確定ポイント」にフォーカスを当ててクイズアプリを作成しました。
　
## ユーザーの課題🤦‍♂️
既存のクイズアプリやサービスは主に以下の課題が存在します。
- ❌問題がニッチ過ぎて「ベタ問題」を集中的に練習できない
- ❌問題文が最初から全文表示されてしまうため「確定ポイント」を極められない
  - 例： *「細長いシュークリームにチョコレートをかけた洋菓子は何でしょう？」* まで見えてしまい答えが分かってしまう
- ❌毎日の継続的な練習ができない
　
## BetaMasterの提供価値🙆‍♀
- ✅出題される問題をベタ問題に特化
- ✅問題文を確定ポイントで止めて出題することで質の高い練習を実現
- ✅毎日1問でもクイズに触れられる環境作り
　
## 機能一覧💡
### ベタ問題ランダム出題
登録されたベタ問題からランダムで出題し続けます。問題文は自動的に確定ポイントで止まり、ボタンを押下することで続きを表示できます。また、sessionを活用することで一度見た問題が何度も表示されないよう制御しています。後述のマイクイズ帳機能を用いて好きなクイズだけを出題することもできます。

<img width="700" alt="random quiz" src="https://github.com/user-attachments/assets/f7f2d8d6-645f-4c91-9c9c-7426c14d4459">

### ベタ問題検索
インクリメンタルサーチでクイズを検索することが出来ます。ジャンル指定も可能です。

<img width="700" alt="quiz search" src="https://github.com/user-attachments/assets/2ec67bed-45e6-4ff0-8b8b-f2dca78f7732">

### LINEログイン
LINEアカウントを用いてユーザー登録をすぐに行えます。

<img width="700" alt="quiz search" src="https://github.com/user-attachments/assets/a63566cd-4b80-44ef-a83c-e5e1c985b729">

### マイクイズ帳登録
マイクイズ帳にクイズを登録することが出来ます。

<img width="700" alt="my quiz" src="https://github.com/user-attachments/assets/c04844aa-dc01-445a-b561-aba15560223a">

### LINE通知
毎朝マイクイズ帳に保存していないクイズをランダムでLINE通知することが出来ます。通知設定はマイページから行えます。

<img width="700" alt="my quiz" src="https://github.com/user-attachments/assets/c4e04e94-194a-4ca3-9600-04d1a17a5e01">
<img width="700" alt="my quiz" src="https://github.com/user-attachments/assets/f76cb4c4-1902-4f96-bc63-1b1109cbfa24">

## ER図🗺
<img width="700" alt="ER-diagram" src="https://github.com/user-attachments/assets/47396354-7bab-4dc9-bbe7-c97abb9ebbc8">


## エンドポイント🌐
| ページ | HTTPメソッド | エンドポイント | controller#action |
| ---- | ---- | ---- | ---- |
| トップページ | GET | / | static_pages#top |
| ログイン画面表示 | GET | /oauth/:provider | oauths#oauth |
| OauthからのCallbackリンク | POST | oauth/callback | oauths#callback |
| ログアウト | DELETE | /logout | user_sessions#destroy |
| ユーザー登録完了ページ | GET | /complete_signup | static_pages#complete_signup |
| クイズ一覧 | GET | /quizzes | quizzes#index |
| マイクイズ帳追加 | POST | /quizzes/:id/bookmarks | quizzes/bookmarks#create |
| マイクイズ帳削除 | POST | /quizzes/:id/bookmarks | quizzes/bookmarks#destroy |
| ランダムクイズ出題 | GET | /quizzes/:id/random_exam | quizzes/random_exam#show |
| ランダムクイズ終了 | DELETE | /quizzes/random_exam | quizzes/random_exam#destroy |
| マイクイズ帳出題 | GET | /quizzes/:id/bookmarked_exam | quizzes/random_exam#show |
| マイクイズ帳出題終了 | DELETE | /quizzes/bookmarked_exam | quizzes/random_exam#destroy |
| マイクイズ帳一覧 | GET | /mypage/quizzes | mypage/quizzes#index |
| LINE通知設定ページ | GET | /mypage/line_notification | mypage/line_notifications#edit |
| LINE通知設定変更 | PATCH | /mypage/line_notification | mypage/line_notifications#update |
| ユーザー設定 | GET | /mypage/account | mypage/account#edit |
| ユーザー退会 | DELETE | /users/:id | users#destroy |


## WF🎨
https://miro.com/app/board/uXjVK4jPa5M=/?moveToWidget=3458764593607643310&cot=14

<a href="https://miro.com/app/board/uXjVK4jPa5M=/?moveToWidget=3458764593607643310&cot=14">
  <img width="700" alt="wire frame" src="https://github.com/user-attachments/assets/c4e99748-c766-4d43-85cb-0bd5c0005ab5" >
</a>

## 使用技術⚙️
### インフラ構成
今回知識の棚卸しも兼ねてAWSにてホストしました。開発環境にDockerを用いたためデプロイもECSで行っています。

AppコンテナはマルチAZ構成にしましたが、DB関連は費用の都合上シングルAZで配置しています（本来はマルチAZにてレプリケーションすることが望ましいです）

<img width="700" alt="architecture" src="https://github.com/user-attachments/assets/08e85477-8a60-4bb0-a183-181d803ca71c" >

### バックエンド
- Ruby3.3.3
- Ruby on Rails7.1.3.4 (esbuild)
### フロントエンド
- JavaScript（Stimulus）
- TailwindCSS
- DaisyUI
### DB
- PostgreSQL
- Redis(Sidekiq用)
### テスト
- Rspec
- Capybara
### リンター
- Rubocop
- ERB-lint
### CI
- GitHub Actions
### 開発環境
- Docker
### 本番環境(AWS)
- VPC
- ECS
- ECR
- ALB
- RDS
- Elasticache
- Route53
### 主なGem
- sorcery
- draper
- line-bot-api
- sidekiq
- sidekiq-scheduler
- config
- meta-tags
- annotate
- factory-bot

## こだわりポイント✅
### 事前設計
仕様書を事前に作成し、抜け漏れがないよう開発を進めることを意識しました。主に以下を詳細に検討しました。
- DB設計
- エンドポイント設計
- クラスメソッド,インスタンスメソッド
- WF

### Hotwireの活用
SPAライクな使用感を実現するため以下の理由からHotwireを多く活用しました。クイズ出題画面の問題文制御などはStimulusで実装しています。
- 少ない学習コスト
- 必要な箇所にピンポイントで組み込みやすい
- Rails7に標準搭載されている

### 開発管理にGitHub issueを活用
個人開発ではありますが、チーム開発を意識してGitHub issueとプルリクを作成して開発を進めました。
<img width="600" alt="image" src="https://github.com/user-attachments/assets/4d5102ca-0773-42ae-ab81-9725ce764888">
<img width="600" alt="image" src="https://github.com/user-attachments/assets/38a32bca-3727-483f-acbf-985e9ddae699">


## 今後の実装機能🆕
以下の機能を今後実装していく予定です。
- 管理画面でのクイズのcsv一括登録
- 「覚えた/覚えていないフラグ」の追加
- CDの導入

## 環境構築
`$git clone git@github.com:pileray/beta-master.git`

`$docker compose up`

`$docker compose run --rm  web rails db:create`

`$docker compose run --rm  web rails db:migrate`

`$docker compose run --rm  web rails db:seed`
