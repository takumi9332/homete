# Homete

## 概要
自分の努力したことを褒めてもらうアプリ

### URL

### 機能一覧

### 使用している技術一覧

### 制作背景
自分が何か頑張っているときに、人に褒めてもらうことで頑張れることがあった。その経験から何か頑張っていることをアウトプットする場を作り、それを褒めてもらうシステムを作ることができたらいいなと思い制作した。褒める側にも何かメリットがないといけないので、そこで褒めてもらう側が設定した金額を、一番褒めるのが上手だった人に渡すという機能を設けた。そのことにより褒める側も自分が一番上手く褒めれるように努力をするので、双方にとって金額以上のメリットがもたらせるのではないかと考えた。

# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| self_introduction  | text    |                           |
| image              | string  |                           |

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

| Column | Type       | Options                                        |
| ------ | ---------- | ---------------------------------------------- |
| user   | references | null: false, foreign_key: true                 |
| follow | references | null: false, foreign_key: { to_table: :users } |

### Association
- belongs_to :user
- belongs_to :follow, class_name: 'User'


## bests テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| praise | references | null: false, foreign_key: true |
| post   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :praise
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
