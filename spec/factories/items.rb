FactoryBot.define do
  factory :item do
    name { '商品名' }
    description { '商品の説明' }
    category_id { 2 }
    status_id { 2 }
    delivery_fee_id { 2 }
    prefecture_id { 2 }
    delivery_time_id { 2 }
    price { 300 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end
