FactoryBot.define do
  factory :purchase_address do
    token { "tok_abcdefghijk00000000000000000" }
    postal_code   { '123-4567' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city  { '市区町村' }
    house_number  { '1-1' }
    building_name {'建物名'}
    phone_number {'01234567890'}
  end
end
