# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| self_introduction  | text    |                           |

### Association
- has_many :posts
- has_many :praises
- has_one :card, dependent: :destroy
- has_many :likes
- has_many :bests
- has_many :point_histories
- has_many :user_points
- has_many :charges
- has_many :pays


## posts テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title  | string     | null: false                    |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :praises
- belongs_to :best


## praises テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| post   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :post


## cards テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| card_token     | string     | null: false                    |
| customer_token | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## likes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## bests テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| post   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :post


## point_histories テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| amount     | integer    | null: false                    |
| type       | string     | null: false                    |
| type_id    | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :point_breakdowns
- has_many :user_points, through: :point_breakdowns
- belongs_to :pointable, polymorphic: true


## point_breakdowns テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| amount        | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| point_history | references | null: false, foreign_key: true |

### Association
- belongs_to :user_point
- belongs_to :point_history


## user_points テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| amount | integer    | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :point_breakdowns
- has_many :point_histories, through: :point_breakdowns


## charges テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| amount | integer    | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association
- has_one :point_history, as: :pointable, inverse_of: :pointable
- belongs_to :user


## pays テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| amount | integer    | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association
- has_one :point_history, as: :pointable, inverse_of: :pointable
- belongs_to :user
