FactoryGirl.define do
  factory :shopping_cart_delivery, class: 'ShoppingCart::Delivery' do
    company 'New post'
    delivery_method 'Ground'
    price 1.5
  end
end
