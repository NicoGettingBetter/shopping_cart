FactoryGirl.define do
  factory :shopping_cart_coupon, class: 'ShoppingCart::Coupon' do
    code '111111'
    sale 20
  end

  factory :shopping_cart_coupon_empty, class: 'ShoppingCart::Coupon' do 
    code ''
  end
end
