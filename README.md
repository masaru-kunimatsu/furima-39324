# README

## users
|Column               |Type   |Options                  |
|---------------------|-------|-------------------------|
|nickname             |string |null: false              |
|email                |string |null: false, unique: true|
|encrypted_password   |string |null: false              |
|last_name            |string |null: false              |
|first_name           |string |null: false              |
|last_name_phonetic   |string |null: false              |
|first_name_phonetic  |string |null: false              |
|birth_year           |date   |null: false              |
|birth_month          |date   |null: false              |
|birth_day            |date   |null: false              |

### Association
has_many :items
has_many :purchase_records



## items
|Column                 |Type      |Options                       |
|-----------------------|----------|------------------------------|
|product_name           |string    |null: false                   |
|description            |text      |null: false                   |
|category_id            |integer   |null: false                   |
|condition_id           |integer   |null: false                   |
|shipping_cost_burden_id|integer   |null: false                   |
|prefecture_id          |integer   |null: false                   |
|shipping_day_id        |integer   |null: false                   |
|price                  |integer   |null: false                   |
|user                   |references|null: false, foreign_key: true|

### Association
belongs_to :user
has_one :purchase_record



## purchase_records
|Column              |Type      |Options                       |
|--------------------|----------|------------------------------|
|user                |references|null: false, foreign_key: true|
|item                |references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :shipping_adress



## shipping_adresses
|Column              |Type      |Options                       |
|--------------------|----------|------------------------------|
|postal_code         |string    |null: false                   |
|prefecture_id       |integer   |null: false                   |
|city                |string    |null: false                   |
|block_number        |string    |null: false                   |
|building            |string    |------------------------------|
|telephone_number    |string    |null: false                   |
|purchase_record     |references|null: false, foreign_key: true|

### Association
belongs_to :purchase_record