module ShoppingCart
  class Ability
    include CanCan::Ability

    def initialize(user)
      if user
        can :manage, [ShoppingCart::Order, ShoppingCart::OrderItem,
          ShoppingCart::User], user_id: user.id
        if user.admin?
          can :manage, [ShoppingCart::Order, ShoppingCart::Delivery,
            ShoppingCart::Coupon, User, ShoppingCart::OrderItem]
        end
      end
    end
  end
end
