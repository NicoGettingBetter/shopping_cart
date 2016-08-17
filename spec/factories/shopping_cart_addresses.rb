FactoryGirl.define do
  factory :shopping_cart_address, class: 'ShoppingCart::Address' do
    first_name "MyString"
    last_name "MyString"
    street "MyString"
    zipcode 1
    city "MyString"
    phone "MyString"
    country nil
  end
end
