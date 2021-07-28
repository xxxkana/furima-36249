# README

## users テーブル

| Column                        | Type     | Options     |
| ----------------------------- | -------- | ----------- |
| email                         | string   | null: false, unique: true|
| encrypted_password            | string   | null: false |
| nickname                      | string   | null: false |
| family_name                   | string   | null: false |
| first_name                    | string   | null: false |
| family_name_reading           | string   | null: false |
| first_name_reading            | string   | null: false |
| datetime                      | date     | null: false |

### Association

- has_many :items
 belongs_to :address



## user-item テーブル

| Column                        | Type        | Options                                  | 
| ----------------------------- | ----------- | ---------------------------------------- |
| user                          | reference   | null: false, foreign_key: true           |
| item                          | reference   | null: false, foreign_key: true           |

### Association

has_many :users
has_many :items






## items テーブル

| Column                        | Type     | Options                          |
| ----------------------------- | -------- | -------------------------------- |
| name                          | string   | null: false                      |
| comments                      | text     | null: false                      |
| price                         | integer  | null: false                      |
| category_id                   | integer  | null: false                      |
| condition_id                  | integer  | null: false                      |
| delivery_fee_id               | integer  | null: false                      |
| shipment_area_id              | integer  | null: false                      |
| shipment_day_id               | integer  | null: false                      |
| user                          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :address



## addresses テーブル

| Column                        | Type     | Options                          |
| ----------------------------- | -------- | -------------------------------- |
| postal_code                   | string   | null: false                      |
| prefecture_id                 | string   | null: false                      |
| city                          | string   | null: false                      |
| house_number                  | string   | null: false                      |
| building_number               | string   |                                  |


### Association

- belongs_to :user
- belongs_to :item