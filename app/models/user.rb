class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :residence
  has_many :products
  has_many :cards
  validates :nickname, :birth_date,           presence: true
  validates :last_name, :name,                format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name_rubi, :name_rubi,      format: {with: /\A[ぁ-んー－]+\z/}
end
