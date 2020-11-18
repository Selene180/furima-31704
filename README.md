# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| password             | string | null: false |
| name                 | string | null: false |
| Birthday             | date   | null: false |
| full-width character | string | null: false |
| full-width katakana  | string | null: false |

### Association

* has_many :items
- has_one :user


## items テーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| image               | string     | null: false       |
| Product_name        | string     | null: false       |
| Product_description | string     | null: false       |
| Product_details     | string     | null: false       |
| Regarding_delivery  | string     | null: false       |
| price               | string     | null: false       |
| user                | references | foreign_key: true |

### Association

- belongs_to :user

## Purchase records テーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| item                | references | foreign_key: true |
| user                | references | foreign_key: true |

### Association

- belongs_to :user

## address テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture    | string     | null: false       |
| city          | string     | null: false       |
| house_number  | string     | null: false       |
| building_name | string     | null: false       |
| user          | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item