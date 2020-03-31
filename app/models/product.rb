class Product < ApplicationRecord
  belongs_to :seller, class_name: "User"
  has_many :images, dependent: :destroy
  belongs_to :category
end