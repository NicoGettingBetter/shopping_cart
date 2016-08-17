FactoryGirl.define do
  factory :shopping_cart_order, class: 'ShoppingCart::Order' do
    state "MyString"
    total_price 1.5
    completed_date "2016-08-15 15:16:48"
    user nil
    billing_address nil
    shipping_address nil
    coupon nil
    delivery nil
  end
end
