#テーブル設計

##users　テーブル

| Column          | Type    | Options                     |
| --------------- | ------- | --------------------------  |
| nickname        | string  | null:  false, unique: true   |
| email           | string  | null:  false, unique: true   |
| password        | string  | null:  false                 |
| first_name      | string  | null:  false                 |
| last_name       | string  | null:  false                 |
| first_name_kana | string  | null:  false                 |
| last_name_kana  | string  | null:  false                 |
| birthday        | date    | null:  false                 |

### Association
- has_many :items
- has_many :purchases

##items　テーブル

| Column               | Type         | Options                         |
| -------------------- | -----------  | ------------------------------- |
| name                 | string       | null:  false                    |
| explanation          | text         | null:  false                    |
| category_id          | integer      | null:  false                    |
| status_id            | integer      | null:  false                    |
| delivery_payment_id  | integer      | null:  false                    |
| prefecture_id        | integer      | null:  false                    |
| shipping_period_id   | integer      | null:  false                    |
| price                | integer      | null:  false                    |
| user                 | references   | null:  false,foreign_key: true  |

### Association
- belongs_to :user
- has_one :purchase

##purchases　テーブル

| Column  | Type        | Options                         |
| ------- | ----------- | ------------------------------- |
| user    | references  | null:  false,foreign_key: true  |
| item    | references  | null:  false,foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

##addressesテーブル

| Column        | Type        | Options                         |
| ------------- | ----------- | ------------------------------- |
| postal_code   | string      | null:  false                    |
| prefecture_id | integer     | null:  false                    |
| city          | string      | null:  false                    |
| house_number  | string      | null:  false                    |
| building_name | string      | null:  true                     |
| phone_number  | string      | null:  false                    |
| purchase      | references  | null:  false,foreign_key: true  |

### Association
- belongs_to :purchase