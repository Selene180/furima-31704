FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name { '宮本' }
    first_name { '浩次' }
    birthday { Faker::Date.backward }
    full_width_character { 'ミヤモト' }
    full_width_katakana { 'ヒロジ' }
  end
end
