FactoryGirl.define do
  factory :shopping_cart_order_item, class: 'ShoppingCart::OrderItem' do
    price 1.5
    quantity 1
    order_id ""
    item nil
  end
end
