class RemoveColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :size,                     :string
    remove_column :products, :products_status,          :string
    remove_column :products, :shipping_charges,         :string
    remove_column :products, :shipping_method,          :string
    remove_column :products, :delivery_area,            :string
    remove_column :products, :estimated_delivery_date,  :string
  
  end
end
