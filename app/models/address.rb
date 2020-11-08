class Address < ApplicationRecord
  # with_options presence: ture do
  #   validates :postal_code
  #   validates :prefecture_id
  #   validates :city
  #   validates :house_number
  #   validates :building_name
  #   validates :phone_number
  # end

  belongs_to :purchase
end
