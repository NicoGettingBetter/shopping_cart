FactoryGirl.define do
  factory :shopping_cart_country, class: 'ShoppingCart::Country' do
    name FFaker::Address.country
  end
end
