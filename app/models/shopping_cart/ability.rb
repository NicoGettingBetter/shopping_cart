module ShoppingCart
  class Ability
    include CanCan::Ability

    def initialize(user)
      if user
        can :manage, ShoppingCart::Order, user_id: user.id
        can :manage, ShoppingCart::OrderItem, order_id: user.current_order.id
        if user.try :admin?
          can :manage, [ShoppingCart::Order, ShoppingCart::Delivery,
            ShoppingCart::Coupon, ShoppingCart::OrderItem]
        end
      end
    end
  end
end
