class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,                           null: false
      t.string :text,                           null: false
      t.string :size
      t.string :products_status,                null: false
      t.string :shipping_charges,               null: false
      t.string :shipping_method,                null: false
      t.string :delivery_area,                  null: false
      t.string :estimated_delivery_date,        null: false
      t.string :bland_name
      t.string :selling_price,                  null: false
      t.string :purchase_status,                null: false, default: "出品中­"
      
      t.timestamps
    end
  end
end
