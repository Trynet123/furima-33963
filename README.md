## users

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_reading  | string  | null: false |
| first_name_reading | string  | null: false |
| birth_day          | date    | null: false |

### Association
- has_many :items
- has_many :transactions

## items

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association
- has_one :transaction
- belongs_to :user

## item_transactions

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |


### Association
- has_one :address
- belongs_to :user
- belongs_to :item


## addresses

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | string  | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| house_number | string  | null: false |
| phone_number | string  | null: false |


### Association
- belongs_to :transaction
