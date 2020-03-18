# README　DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|last-name|string|null: false|
|name|string|null: false|
<!-- 苗字　ふりがな -->
|last-name-rubi|string|null: false|
<!-- 名前　ふりがな -->
|name-rubi|string|null: false|
<!-- 郵便番号 -->
|postal-code|integer|null: false|
<!-- 都道府県 -->
|prefectures|string|null: false|
<!-- 市区町村 -->
|municipality|string|null: false|
|address|integer|null: false|
|apartment,room_number|string|null: false|
|phone_number|integer|null: false|
<!-- 決算方法 -->
|payment-method_id|integer|null: false|
|point_id|integer|null: false|
### Association
- has_many :products
- has_many :purchases
- has_many :payment-methods
- belongs_to :point





## productsテーブル
|Column|Type|Options|
|------|----|-------|
|image_id|integer|null: false|
|product-name|string|null: false|
|category-big|string|null: false|
|category-midle|string||
|category-small|string||
|size|string||
|brand_id|string||
<!-- 商品状態 -->
|product-status|string|null: false|
|shipping-charges|string|null: false|
|shipping-method|string|null: false|
|delivery-area|string|null: false|
<!-- 配送予定日 -->
|estimated-delivery-date|string|null: false|
|price_id|integer|null: false|
### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :image
- belongs_to :price
- belongs_to :purchase




<!-- 購入テーブル -->
## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|product_id|integer|null: false|
|buyer|string|null: false|
### Association
- belongs_to :user
- belongs_to :product



## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand-name|string||
### Association
- has_many :products



## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|integer|null: false|
|product_id|string|null: false|
### Association
- has_many :products



## pricesテーブル
|Column|Type|Options|
|------|----|-------|
|sellingーprice|string|null: false|
### Association
- has_many :products



<!-- 決算方法テーブル -->
## payment-methodsテーブル
|Column|Type|Options|
|------|----|-------|
|card-number|integer|null: false|
|expiration-month|integer|null: false|
|expiration-date|integer|null: false|
|security-code|integer|null: false|
### Association
- has_many :users


## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|point|integer|null: false|
|user_id|integer|null: false|
### Association
- belongs_to :user