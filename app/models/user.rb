class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :birthday, presence: true
  validates :full_width_character, presence: true
  validates :full_width_katakana, presence: true

  has_many :items
  has_many :purchase_records

  validates :nickname, presence: true, length: { maximum: 40 }
end
