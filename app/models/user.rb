class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Input half_width alphanumeric.' }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is invalid. Input full_width characters.' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is invalid. Input full_width characters.' }
    validates :birthday
    validates :full_width_character, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full_width characters.' }
    validates :full_width_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full_width katakana characters.' }
  end

  has_many :items
  has_many :purchase_records
end
