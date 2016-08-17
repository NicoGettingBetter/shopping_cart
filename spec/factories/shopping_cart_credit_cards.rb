FactoryGirl.define do
  factory :shopping_cart_credit_card, class: 'ShoppingCart::CreditCard' do
    number "MyString"
    cvv 1
    expiration_month "MyString"
    expiration_year 1
    order_id ""
  end
end
