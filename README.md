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

## users テーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| birthday           | string | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type   | Options     |
|-----------------|--------|-------------|
| product_name    | string | null: false |
| product_version | string | null: false |
| product_detail  | string | null: false |
| price           | string | null: false |
| delivery_charge | string | null: false |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column     | Type      | Options                        |
|------------|-----------|--------------------------------|
| item       | references| null: false, foreign_key: true |
| user       | references| null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_many :address

## address テーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order