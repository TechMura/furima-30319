FactoryBot.define do
  factory :item do
    name                  { Faker::Base.regexify('[123nameなまえナマエ名前]{40}') }
    explanation           { Faker::Base.regexify('[123explanationせつめいセツメイ説明]{1000}') }
    category_id           { Faker::Number.between(from: 1, to: 11) }
    status_id { Faker::Number.between(from: 1, to: 6) }
    delivery_payment_id   { Faker::Number.between(from: 1, to: 2) }
    prefecture_id         { Faker::Number.between(from: 1, to: 47) }
    shipping_period_id    { Faker::Number.between(from: 1, to: 3) }
    price                 { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
