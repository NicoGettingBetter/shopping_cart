FactoryGirl.define do
  factory :shopping_cart_address, class: 'ShoppingCart::Address' do
    first_name FFaker::Name.first_name
    last_name FFaker::Name.last_name
    street FFaker::Address.street_address
    zipcode 1
    city FFaker::Address.city
    phone '+61471957806'
    country_id 1
  end

  factory :shopping_cart_address_empty, class: 'ShoppingCart::Address' do
    first_name ''
    last_name ''
    street ''
    zipcode ''
    city ''
    phone ''
    country_id ''
  end
end
