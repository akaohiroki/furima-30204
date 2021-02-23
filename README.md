## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first name         | string | null: false               |
| last name          | string | null: false               |
| first name KANA    | string | null: false               |
| last name KANA     | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :products
- has_many :purchases


## products テーブル

| Column      | Type       | Options           |
| ----------  | ---------- | ----------------- |
| name        | string     | null: false       |
| description | text       | null: false       |
| price       | integer    | null: false       |
| fee         | integer    |                   |
| profit      | integer    |                   |
| user        | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| name   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :address


## addresses テーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| address | string | null: false |

### Association

- belongs_to :purchase