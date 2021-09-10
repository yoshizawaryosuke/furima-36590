FactoryBot.define do
  factory :buy_shipping_address do
    postal_code   { '123-4567' }
    prefecture_id { 1 }
    city          { '埼玉県' }
    house_number  { '1-1' }
    building      { '埼玉ハイツ' }
    phone_number  { '09012345678' }

    token { 'tok_abcdefghijk00000000000000000' }
  end
end
