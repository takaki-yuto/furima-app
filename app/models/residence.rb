class Residence < ApplicationRecord
  belongs_to :user, dependent: :destroy, optional: true
  
  validates :destination_last_name, :destination_name, :prefectures, :municipality,
            numericality: false, format: {with: /\A[ぁ-んァ-ン一-龥]/}, presence: true
  
  validates :destination_last_name_rubi, :destination_name_rubi,
            numericality: false,format: {with: /\A[ぁ-んー－]+\z/}, presence: true

  validates :address, presence: true

  validates :postal_code,   length: { is: 7 } ,     numericality: true, format: {with: /\A\d{7}\z/ }, presence: true
  validates :phone_number,  length: { in: 10..11 }, numericality: true, format: {with: /\A\d{10,11}\z/ }
end
