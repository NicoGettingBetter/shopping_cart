module ShoppingCart
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception

    helper_method :current_order

    delegate :current_order, to: :current_user
  end
end
