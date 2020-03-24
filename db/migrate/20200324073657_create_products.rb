class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,                           null: false
      t.string :size
      t.string :status,                         null: false
      t.string :shipping_charges,               null: false
      t.string :shipping_method,                null: false
      t.string :delivery_area,                  null: false
      t.string :estimated_delivery_date,        null: false
      t.string :buyer,                          null: false
      t.string :purchase_time,                  null: false
      t.string :selling_price,                  null: false
      
      t.references :user,                        null: false, foreign_key: true

      t.timestamps
    end
  end
end
