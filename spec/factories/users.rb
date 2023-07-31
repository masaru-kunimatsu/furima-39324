FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.custom_password }
    password_confirmation { password }
    last_name             { Faker::Japanese.random_japanese(3) }
    first_name            { Faker::Japanese.random_japanese(3) }
    last_name_phonetic    { Faker::Japanese.custom_katakana }
    first_name_phonetic   { Faker::Japanese.custom_katakana }
    birth_day             { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end