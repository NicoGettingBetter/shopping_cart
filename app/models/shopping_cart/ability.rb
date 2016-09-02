module ShoppingCart
  class Ability
    include CanCan::Ability

    def initialize(user)
      if user
        can :manage, [Order, OrderItem, User], user_id: user.id
      end
    end
  end
end
