class Product < ApplicationRecord

  belongs_to :seller, class_name: "User"
  has_many :images, dependent: :destroy
    # has_one :purchasement
  # belongs_to :buyer, class_name: "User", through: :purchasement

end