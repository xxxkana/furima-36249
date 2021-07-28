# README

## users テーブル

| Column                        | Type     | Options     |
| ----------------------------- | -------- | ----------- |
| email                         | string   | null: false |
| encrypted_password            | string   | null: false |
| nickname                      | string   | null: false |
| family_name                   | text     | null: false |
| first_name                    | text     | null: false |
| family_name_reading           | string   | null: false |
| first_name_reading            | string   | null: false |
| datetime                      | string   | null: false |

### Association

- has_many :goods
- has_many :purchases



## user-item テーブル

| Column                        | Type     | Options     |
| ----------------------------- | -------- | ----------- |
| user_id                       | string   |             |
| item_id                       | string   |             |

### Association

- has_many :goods
- has_many :purchases






## items テーブル

| Column                        | Type     | Options                          |
| ----------------------------- | -------- | -------------------------------- |
| name                          | string   | null: false                      |
| comments                      | text     | null: false                      |
| price                         | integer  | null: false                      |
| category_id                   | integer  | null: false                      |
| condition_id          | integer  | null: false                      |
| delivery_fee_id               | integer  | null: false                      |
| shipment_area_id              | integer  | null: false                      |
| shipment_day_id               | integer  | null: false                      |
| user                          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchases




## addresses テーブル

| Column                        | Type     | Options                          |
| ----------------------------- | -------- | -------------------------------- |
| postal_code                   | string   | null: false                      |
| prefecture_id                 | string   | null: false                      |
| city                          | string   | null: false                      |
| house_number                  | string   | null: false                      |
| building_number               | string   |                                  |
| user                          | references | null: false, foreign_key: true |
| good                          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :goods