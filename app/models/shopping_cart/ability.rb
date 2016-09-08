module ShoppingCart
  class Ability
    include CanCan::Ability

    def initialize(user)
      if user
        can :manage, Order, user_id: user.id
        can :manage, OrderItem, user_id: user.id
        can :manage, User, user_id: user.id
        if user.admin?
          can :manage, [Order, Delivery, Coupon, User, OrderItem]
        end
      end
    end
  end
end
