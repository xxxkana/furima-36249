# README

## users テーブル

| Column                        | Type     | Options                  |
| ----------------------------- | -------- | ------------------------ |
| nickname                      | string   | null: false              |
| email                         | string   | null: false, unique: true|
| encrypted_password            | string   | null: false              |
| family_name                   | string   | null: false              |
| first_name                    | string   | null: false              |
| family_name_reading           | string   | null: false              |
| first_name_reading            | string   | null: false              |
| datetime                      | date     | null: false              |

### Association

has_many :items
has_many : user-items


## user-items テーブル

| Column                        | Type       | Options                        | 
| ----------------------------- | -----------| -------------------------------|
| user                          | references | foreign_key: true              |    
| item                          | references | foreign_key: true              |
### Association

belongs_to :user
belongs_to :item
has_one :address



## items テーブル

| Column                        | Type     | Options                          |
| ----------------------------- | -------- | -------------------------------- |
| name                          | string   | null: false                      |
| comments                      | text     | null: false                      |
| price                         | integer  | null: false                      |
| category_id                   | integer  | null: false                      |
| condition_id                  | integer  | null: false                      |
| delivery_fee_id               | integer  | null: false                      |
| prefecture_id                 | integer  | null: false                      |
| shipment_day_id               | integer  | null: false                      |
| user                          | references | foreign_key: true              |



### Association

- belongs_to :user
- has_one :user-item



## addresses テーブル

| Column                        | Type     | Options                          |
| ----------------------------- | -------- | -------------------------------- |
| postal_code                   | string   | null: false                      |
| prefecture_id                 | integer  | null: false                      |
| city                          | string   | null: false                      |
| house_number                  | string   | null: false                      |
| building_number               | string   |                                  |
| phone_number                  | string   | null: false                      |
| user_item                     | references | foreign_key: true              |


### Association

- belongs_to :user-item


## tags テーブル

| Column                        | Type     | Options                          |
| ----------------------------- | -------- | -------------------------------- |
| tag_name                      | string   | null: false                      |


## item_tag_relations テーブル

| Column                        | Type       | Options                          |
| ----------------------------- | ---------- | -------------------------------- |
| item                          | references | foreign_key: true                | 
| tag_name                      | references | foreign_key: true                |
