## usersテーブル

| Column          | Type     | Options                   |
| --------------- | -------- | ------------------------- |
| email           | string   | null: false, unique: true |
| password        | string   | null: false               |
| nickname        | string   | null: false               |
| last_name       | string   | null: false               |
| first_name      | string   | null: false               |
| last_name_kana  | string   | null: false               |
| first_name_kana | string   | null: false               |
| birthday        | date     | null: false               |

### Association
has_many :items
has_many :buys

## itemsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| category_id         | integer    | null: false                    |
| image               |            | ActiveStorage                  |
| price               | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| description         | text       | null: false                    |
| area_id             | integer    | null: false                    |
| date_of_shipment_id | integer    | null: false                    |
| burden_id           | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one    :buy

## buysテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one    :address

## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| house_number  | integer    | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| buy           | references | null: false, foreign_key: true |

### Association
belongs_to :buy
