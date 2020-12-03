FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '横浜' }
    house_number { '青山111' }
    phone_number { '09012345678' }
    association :user
    association :item
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
