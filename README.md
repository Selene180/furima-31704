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
| full_width character | string | null: false |
| full_width katakana  | string | null: false |

### Association

* has_many :items
- has_one :address
- has_many :purchase_record


## items テーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| name                  | string     | null: false       |
| description           | string     | null: false       |
| details               | string     | null: false       |
| category              | string     | null: false       |
| status                | string     | null: false       |
| regarding_delivery_id | integer    | null: false       |
| delivery_fee          | string     | null: false       |
| shipping_area         | string     | null: false       |
| delivery_time         | string     | null: false       |
| price                 | integer    | null: false       |
| user                  | references | foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| item                | references | foreign_key: true |
| user                | references | foreign_key: true |

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
| purchase_record | references | foreign_key: true |

### Association

- belongs_to :purchase_record