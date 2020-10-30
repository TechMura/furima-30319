class Item < ApplicationRecord

  validates :name,                presence: true
  validates :explanation,         presence: true
  validates :category_id,         presence: true, numericality: { other_than: 1 }
  validates :status_id,           presence: true, numericality: { other_than: 1 }
  validates :delivery_payment_id,  presence: true, numericality: { other_than: 1 }
  validates :prefecture_id,       presence: true, numericality: { other_than: 1 }
  validates :shipping_period_id,  presence: true, numericality: { other_than: 1 }
  validates :price,               presence: true
  
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_payment
  belongs_to_active_hash :shipping_period

end
