class CreateResidences < ActiveRecord::Migration[5.2]
  def change
    create_table :residences do |t|
      t.string :destination_last_name,           null: false
      t.string :destination_name,                null: false
      t.string :destination_last_name_rubi,      null: false
      t.string :destination_name_rubi,           null: false
      t.string :postal_code,                     null: false
      t.string :prefectures,                     null: false
      t.string :municipality,                    null: false
      t.string :address,                         null: false
      t.string :apartment,                       null: false
      t.string :phone_number
      t.references :user,                        null: false, foreign_key: true
      
      t.timestamps
      t.timestamps
    end
  end
end
