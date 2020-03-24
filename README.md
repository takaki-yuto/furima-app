# README DB設計


## usersテーブル
<!-- 苗字のふりがな:last_name-rubi -->
<!-- 名前のふりがな:name_rubi -->
<!-- 決済方法:payment-method_id -->
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|last_name|string|null: false|
|name|string|null: false|
|last_name_rubi|string|null: false|
|name_rubi|string|null: false|
|birth_date|date|null: false|


### Association
- has_many :products
- has_many :payment_methods
- has_one :point
- has_many :messages
- has_one :residence



## residencesテーブル
<!-- 郵便番号:postal_code -->
<!-- 都道府県:prefectures -->
<!-- 市区町村:municipality -->
|Column|Type|Options|
|------|----|-------|
|destination_last_name|string|null: false|
|destination_name|string|null: false|
|destination_last_name_rubi|string|null: false|
|destination_name_rubi|string|null: false|
|postal_code|string|null: false, numericality: true|
|prefectures|string|null: false|
|municipality|string|null: false|
|address|string|null: false|
|apartment|string|null: false|
|phone_number|string|numericality: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user



## productsテーブル
<!-- 商品状態:status -->
<!-- 配送予定日:estimated_delivery_date -->
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|size|string||
|status|string|null: false|
|shipping_charges|string|null: false|
|shipping_method|string|null: false|
|delivery_area|string|null: false|
|estimated_delivery_date|string|null: false|
|buyer|string|null: false|
|purchase_time|string|null: false|
|selling_price|string|null: false|
|brand_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :brand
- has_many :images
- belongs_to : category



## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products



## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|integer|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product








<!--  決算方法テーブル -->
## payment_methodsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|expiration_month|integer|null: false|
|expiration_date|integer|null: false|
|security_code|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user


## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|point|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user


## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- has_many :products