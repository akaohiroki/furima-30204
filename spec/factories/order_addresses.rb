FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '新宿区' }
    address { '歌舞伎町1-1' }
    building_name { '歌舞伎ハウス' }
    phone_number { '09012345678' }
  end
end