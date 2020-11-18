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
| encrypted_password   | string | null: false |
| family_name          | string | null: false |
| first_name           | string | null: false |
| birthday             | date   | null: false |
| full-width character | string | null: false |
| full-width katakana  | string | null: false |

### Association

* has_many :items
- has_one :address
- has_one :purchase record


## items テーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| item_name           | string     | null: false       |
| item_description    | string     | null: false       |
| item_details        | string     | null: false       |
| regarding_delivery  | string     | null: false       |
| price               | integer    | null: false       |
| user                | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase record

## purchase records テーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| item                | references | foreign_key: true |
| user                | references | foreign_key: true |
| address             | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : address

## address テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| postal_code     | string     | null: false       |
| prefecture_id   | integer    | null: false       |
| city            | string     | null: false       |
| house_number    | string     | null: false       |
| building_name   | string     |                   |
| phone_number    | string     | null: false       |
| purchase_record | string     | foreign_key: true |

### Association

- belongs_to :purchase record