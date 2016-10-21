module ShoppingCart
  FactoryGirl.define do
    factory :shopping_cart_order, class: 'ShoppingCart::Order' do
      state :in_progress
    end

    factory :shopping_cart_order_in_progress, class: 'ShoppingCart::Order' do
      state :in_progress
    end

    factory :shopping_cart_order_in_queue, class: 'ShoppingCart::Order' do
      state :in_queue
    end

    factory :shopping_cart_order_in_delivery, class: 'ShoppingCart::Order' do
      state :in_delivery
    end

    factory :shopping_cart_order_delivered, class: 'ShoppingCart::Order' do
      state :delivered
    end

    factory :shopping_cart_order_presenter do
    end
  end
end
