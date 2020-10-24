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
-has_many :items
-has_many :purchases
-has_one :address

##items　テーブル

| Column            | Type        | Options                         |
| ----------------- | ----------- | ------------------------------- |
| name              | string      | null:  false                    |
| explanation       | string      | null:  false                    |
| category          | string      | null:  false                    |
| status            | string      | null:  false                    |
| delivery_payment  | string      | null:  false                    |
| prefecture        | string      | null:  false                    |
| shipping_period   | string      | null:  false                    |
| price             | integer     | null:  false                    |
| user              | references  | null:  false,foreign_key: true  |

### Association
-belongs_to :user
-has_many :purchases

##purchases　テーブル

| Column  | Type        | Options                         |
| ------- | ----------- | ------------------------------- |
| day     | date        | null:  false                    |
| user    | references  | null:  false,foreign_key: true  |
| item    | references  | null:  false,foreign_key: true  |

### Association
-belongs_to :user
-belongs_to :item

##addressesテーブル

| Column        | Type        | Options                         |
| ------------- | ----------- | ------------------------------- |
| postal_code   | string      | null:  false                    |
| prefecture    | string      | null:  false                    |
| city          | string      | null:  false                    |
| house_number  | string      | null:  false                    |
| building_name | string      | null:  true                     |
| phone_number  | string      | null:  false                    |
| user          | references  | null:  false,foreign_key: true  |

### Association
-belongs_to :user