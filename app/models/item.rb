class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_time

  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :delivery_time_id, numericality: { other_than: 1 }
    validates :price, format: { with: /\A-?[0-9]+(\.[0-9]+)?\z/, message: "is invalid. Input \thalf-width digit." }
    validates_inclusion_of :price, in: 300..9_999_999, message: 'Product price is for under 300 and over 99999999'
  end
end
