class AddActiveHashIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :size_id,                     :integer, null: false
    add_column :products, :products_status_id,          :integer, null: false
    add_column :products, :shipping_charges_id,         :integer, null: false
    add_column :products, :shipping_method_id,          :integer, null: false
    add_column :products, :delivery_area_id,            :integer, null: false
    add_column :products, :estimated_delivery_date_id,  :integer, null: false
  
  end
end
