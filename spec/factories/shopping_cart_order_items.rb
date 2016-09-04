FactoryGirl.define do
  factory :shopping_cart_order_item, class: 'ShoppingCart::OrderItem' do
    price 5
    quantity 1
  end
end
