## users テーブル

| Column         | Type   | Options     |
| ----------     | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| full name      | string | null: false |
| full name KANA | string | null: false |
| birthday       | string | null: false |

### Association

- has_many :products
- has_many :purchase
- has_one :address


## products テーブル

| Column      | Type       | Options     |
| ----------  | ---------- | ----------- |
| name        | string     | null: false |
| description | text       | null: false |
| price       | integer    | null: false |
| image       |            |             |
| user        | references |             |

### Association

- belongs_to :user
- has_one :purchases
- has_many :addresses


## purchases テーブル

| Column | Type       | Options |
| ------ | ---------- | ------- |
| user   | references |         |
| name   | references |         |

### Association

- belongs_to :user
- belongs_to :product
- has_one :address


## addresses テーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| address | string | null: false |

### Association

- belongs_to :user
- belongs_to :product
- belongs_to :purchase