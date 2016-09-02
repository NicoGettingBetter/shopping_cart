class Ability < ShoppingCart::Ability
  include CanCan::Ability

  def initialize(user)
    super user
  end
end
