FactoryGirl.define do
  factory :shopping_cart_delivery, class: 'ShoppingCart::Delivery' do
    company "MyString"
    delivery_method "MyString"
    price 1.5
    order_id ""
  end
end
