FactoryBot.define do
  factory :item do
    product_name              {Faker::Name.initials(number: 2)}
    description               {Faker::Lorem.paragraph}
    category_id               {Faker::Number.between(from: 2, to: 11)}
    condition_id              {Faker::Number.between(from: 2, to: 7)}
    shipping_cost_burden_id   {Faker::Number.between(from: 2, to: 3)}
    prefecture_id             {Faker::Number.between(from: 2, to: 48)}
    shipping_day_id           {Faker::Number.between(from: 2, to: 4)}
    price                     {Faker::Number.between(from: 300, to: 9999999)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'furima-intro03.png')),filename: 'furima-intro03.png',content_type: 'image/png')
    end
  end
end