class Residence < ApplicationRecord
  belongs_to :user, dependent: :destroy, optional: true
  
  validates :destination_last_name, :destination_name, :prefectures, :municipality,
          numericality: false, format: {with: /\A[ぁ-んァ-ン一-龥]/}  
  validates :destination_last_name_rubi, :destination_name_rubi,
            numericality: false,format: {with: /\A[ぁ-んー－]+\z/}

  validates :address, presence: true

  2
  validates :postal_code,   length: { is: 7 } ,     numericality: true 
  validates :phone_number,  length: { in: 10..11 }, numericality: true, format: {with: /\A\d{10,11}\z/ }, unless: :phone_number_blank

  def phone_number_blank
    phone_number.blank?
  end
end
