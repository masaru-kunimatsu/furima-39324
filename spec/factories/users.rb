FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '123abc' }
    password_confirmation { password }
    last_name             { '田中'}
    first_name            { 'みなみ' }
    last_name_phonetic    { 'タナカ'}
    first_name_phonetic   { 'ミナミ' }
    birth_day             { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end