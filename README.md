# Name
ここのゲレンデのここがスキ（略称ゲレスキ）
ゲレンデについてのコメント投稿を行う

# Description
ゲレンデについてのコメントを各ゲレンデごとにすることができる。

# Usage
### 1.一覧画面にゲレンデ名が全て掲載されている。
### 2.ゲレンデ名より詳細に飛べる。
### 3.詳細ではコメント投稿フォームやコメント一覧表示がある。
### 4.詳細には積雪量のリンクと天気のリンクがある（リンク先は実装予定）。
### 5.ヘッダー部分にゲレンデ名と都道府県名で検索できるフォームがある。
### 6.ヘッダー部分に都道府県一覧があり、都道府県別ゲレンデ一覧に飛べる。

## usersテーブル
｜ Column             | Type       | Option                       |
｜ ------------------ | ---------- | ---------------------------- |
｜ nickname           | string     | null: false                  |
｜ email              | string     | null: false, unique: true    |
｜ encrypted_password | string     | null: false                  |

### Association
- has_many :comments

## gerendesテーブル
｜ Column             | Type       | Option                        |
｜------------------- | ---------- | ----------------------------- |
｜ name               | string     | null false                    |
｜ prefecture_id      | integer    | null false                    |
｜ image              | string     | null false                    |

### Association
- has_many :comments

## commentsテーブル
｜ Column             | Type       | Option                        |
｜ ------------------ | ---------- | ----------------------------- |
｜ user               | references | null false, foreign key :true |
｜ gerende            | references | null false, foreign key :true |
