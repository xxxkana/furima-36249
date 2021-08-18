FactoryBot.define do
  factory :address_user_item do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {"123-0054"}
    prefecture_id     {34}
    city {"横浜市"}
    house_number {"中区山下町1-89-1"}
    building_number {"山下町ビル"}
    phone_number {"0123456789"}
  end
end