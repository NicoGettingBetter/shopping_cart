module ShoppingCart
  class CreditCard < ApplicationRecord
    belongs_to :order
  end
end
