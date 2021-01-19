# README

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
