FactoryGirl.define do
  factory :shopping_cart_credit_card, class: 'ShoppingCart::CreditCard' do
    number '1234123412341234'
    cvv '111'
    expiration_month Date::MONTHNAMES.drop(1).sample
    expiration_year '2018'
  end

  factory :shopping_cart_credit_card_empty, class: 'ShoppingCart::CreditCard' do 
    number ''
    cvv ''
    expiration_month ''
    expiration_year ''
  end
end
