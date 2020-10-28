FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.initials(number: 2) }
    email                   { Faker::Internet.free_email }
    password                { '1234abcd' }
    password_confirmation   { password }
    first_name              { '全角ぜんかくゼンカク' }
    last_name               { '全角ぜんかくゼンカク' }
    first_name_kana { 'ゼンカク' }
    last_name_kana { 'ゼンカク' }
    birthday { '2020-01-01' }
  end
end
