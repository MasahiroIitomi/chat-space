# README

## usersテーブル
|Column|type|Options|
|------|----|-------|
|name|string|null: false, unique:true|
|email|string|null: false, unique:true|
|password|string|null:false, unique:true|

### Association
- has_many :groups, through: :members
- has_many :members
- accepts_nested_attributes_for :members


## groupsテーブル
|Column|type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :users, through: :members
- has_many :members


## membersテーブル
|Column|type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
- accepts_nested_attributes_for :members
