# README

## users

|Column               |Type  |Options                  |
|---------------------|------|-------------------------|
|nickname             |string|null: false              |
|mail_address         |string|null: false, unique: true|
|password             |string|null: false              |
|password_confirmation|string|null: false              |

### Association
has_many :items
has_many :purchase_records



## items

|Column              |Type      |Options                       |
|--------------------|----------|------------------------------|
|product_name        |string    |null: false                   |
|description         |text      |null: false                   |
|category            |string    |null: false                   |
|condition           |string    |null: false                   |
|shipping_cost_burden|string    |null: false                   |
|shipping_origin_area|string    |null: false                   |
|shipping_days       |string    |null: false                   |
|price               |integer   |null: false                   |
|user                |references|null: false, foreign_key: true|

### Association
belongs_to :users
has_one :purchase_records



## purchase_records

|Column              |Type      |Options                       |
|--------------------|----------|------------------------------|
|user                |references|null: false, foreign_key: true|
|item                |references|null: false, foreign_key: true|

### Association
belongs_to :users
belongs_to :items
has_one :shipping_adresses



## shipping_adresses


|Column              |Type   |Options     |
|--------------------|-------|------------|
|postal_code         |integer|null: false |
|prefecture          |string |null: false |
|city                |string |null: false |
|block_number        |string |null: false |
|building            |string |------------|
|telephone_number    |integer|null: false |

### Association
belongs_to :purchase_records