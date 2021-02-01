# アプリケーション名
ここのゲレンデのここがスキ（略称ゲレスキ）  
ゲレンデについてのコメント投稿を行う

# 概要
ゲレンデについてのコメントを各ゲレンデごとにすることができる。そしてそれは世界中誰でも閲覧できる。

# URL
geresuki.herokuapp.com

# 利用方法
### 1.一覧画面にゲレンデ名が全て掲載されている。
### 2.ゲレンデ名よりゲレンデ詳細に飛べる。
### 3.詳細ではコメント投稿フォームやコメント一覧表示がある。
### 4.詳細には積雪量のリンクと天気のリンクがある（リンク先は実装予定）。
### 5.ヘッダー部分にゲレンデ名と都道府県名で検索できるフォームがある。
### 6.ヘッダー部分に都道府県一覧があり、都道府県別ゲレンデ一覧に飛べる。

# 目指した課題解決
ゲレンデの情報は数多くのサイトなどで閲覧することができる。しかし、それらはリフト券の金額やイベント、ゲレンデマップなど多数の情報が混在している。その中からコースの情報のみが集まっているサイトがないと感じていた。コースマップや大まかなコース概要はあるが、詳しいコースの形やオススメの滑り方などが知りたかった。そこで、コースマップがあってコースの詳細を詳しく投稿できるサイトを作成した。これによって、各ゲレンデの滑り方がより鮮明にわかるようになる。

# 実際のGIF
![sample1](https://gyazo.com/a52210301e1af3b2abb23040774ffa09/raw)  

![sample2](https://gyazo.com/f7a52fc01d4214428a2fb4fd5f812ce0/raw)

# ER図
![sample3](https://gyazo.com/26b4cb6e48d8c0b5ad523e535fa9aed5/raw)

# ローカルでの動作方法
ruby version 6.0  
git clone https://github.com/yuyakiso/geresuki.git  
cd geresuki  
bundle install  
rails db:create  
rails db:migrate  
rails s  
👉 http://localhost:3000


## users テーブル

| Column             | Type       | Option                       |
| ------------------ | ---------- | ---------------------------- |
| nickname           | string     | null: false                  |
| email              | string     | null: false, unique: true    |
| encrypted_password | string     | null: false                  |

### Association

- has_many :comments

## gerendes テーブル

| Column             | Type       | Option                        |
|------------------- | ---------- | ----------------------------- |
| name               | string     | null false                    |
| prefecture_id      | integer    | null false                    |
| image              | string     | null false                    |

### Association

- has_many :comments

## comments テーブル

| Column             | Type       | Option                        |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null false, foreign key :true |
| gerende            | references | null false, foreign key :true |

### Association

- belongs_to :user
- belongs_to :gerende
