class Item < ApplicationRecord

  PRICE_REGEX = /\A[0-9]+\z/

  validates :name,                presence: true, length: {maximum: 8}
  validates :explanation,         presence: true, length: {maximum: 1000}
  validates :category_id,         presence: true
  validates :status_id,           presence: true
  validates :delivery_payment_id,  presence: true
  validates :prefecture_id,       presence: true
  validates :shipping_period_id,  presence: true
  validates :price,               presence: true, numericality: {only_integer: true,greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}
  
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_payment
  belongs_to_active_hash :shipping_period

end
