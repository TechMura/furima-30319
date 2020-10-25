FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.initials(number: 2)}
    email                   {Faker::Internet.free_email}
    password                {Faker::internet.password(min_length: 6)}
    password_confirmation   {password}
    first_name              {Gimei.name.last} 
    last_name               {Faker::Japanese::Name.last_name} 
    first_name_kana {}
    last_name_kana
    birthday
  end
end