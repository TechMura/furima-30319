class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  POSTAL_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/.freeze

  with_options presence: true do
    validates :token
    validates :postal_code,   format: {with: POSTAL_CODE_REGEX }
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :building_name
    validates :phone_number,  numericality: { only_integer: true }, length: { maximum: 11 }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, phone_number: phone_number, purchase_id: purchase.id)
  end

end
