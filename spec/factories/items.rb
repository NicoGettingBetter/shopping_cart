FactoryGirl.define do
  factory :book do
    title FFaker::Name.first_name
    instock 10
    price 10
  end
end
