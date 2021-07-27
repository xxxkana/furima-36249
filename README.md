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
| birth_year                    | string   | null: false |
| birth_month                   | string   | null: false |
| birth_day                     | string   | null: false |

### Association

- has_many :goods
- belongs_to :purchases




## goods テーブル

| Column                        | Type     | Options                          |
| ----------------------------- | -------- | -------------------------------- |
| name                          | string   | null: false                      |
| comments                      | text     | null: false                      |
| price                         | integer  | null: false                      |
| user                          | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :purchases




## purchases テーブル

| Column                        | Type     | Options                          |
| ----------------------------- | -------- | -------------------------------- |
| postal_code                   | string   | null: false                      |
| city                          | string   | null: false                      |
| house_number                  | string   | null: false                      |
| building_number               | string   |                                  |
| user                          | references | null: false, foreign_key: true |
| good                          | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :goods