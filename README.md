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
| birthday        | datetime | null: false               |

### Association
has_many :items
has_many :buys

## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| category         | string     | null: false                    |
| image            |            | ActiveStorage                  |
| price            | integer    | null: false                    |
| status           | string     | null: false                    |
| description      | text       | null: false                    |
| area             | string     | null: false                    |
| date_of_shipment | string     | null: false                    |
| burden           | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one    :buy

## buysテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| payment | integer    | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
belongs_to :address

## addressesテーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal_code      | integer    | null: false |
| prefecture       | string     | null: false |
| municipality     | string     | null: false |
| house_number     | integer    | null: false |
| building_name    | string     | null: false |
| phone_number     | integer    | null: false |

### Association
has_one :buy
