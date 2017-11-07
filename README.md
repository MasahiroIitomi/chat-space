# README

## usersテーブル
|Column|type|Options|
|------|----|-------|
|name|string|null: false, unique:true, index: true|
|email|string|null: false, unique:true|
|password|string|null:false, unique:true|

### Association
- has_many :groups, through: :members
- has_many :members
- has_many :messages


## groupsテーブル
|Column|type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|

### Association
- has_many :users, through: :members
- has_many :members
- has_many :messages


## membersテーブル
|Column|type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user


## messagesテーブル
|Column|type|Options|
|------|----|-------|
|body|text|null; false|
|image|string| |
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
