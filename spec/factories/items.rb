FactoryBot.define do
  factory :item do
    name              {Faker::Commerce.name}
    comments          {"テストコード用のコメントです"}
    price             {Faker::Commerce.price(range: 300..9999999)}
    category_id       {5}
    condition_id      {3}
    delivery_fee_id   {2}
    prefecture_id     {10}
    shipment_day_id   {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
