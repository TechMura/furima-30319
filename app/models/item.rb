class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name,                length: { maximum: 40 }
    validates :explanation,         length: { maximum: 1000 }
    validates :category_id
    validates :status_id
    validates :delivery_payment_id
    validates :prefecture_id
    validates :shipping_period_id
    validates :price,               numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_payment
  belongs_to_active_hash :shipping_period
end
