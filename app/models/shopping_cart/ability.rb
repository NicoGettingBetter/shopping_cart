module ShoppingCart
  class Ability
    include CanCan::Ability

    def initialize(user)
      if user
        can :manage, Order, user_id: user.id
        can :manage, OrderItem, order_id: user.current_order.id
        can :manage, User, id: user.id
      end
    end
  end
end
