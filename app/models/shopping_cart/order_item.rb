module ShoppingCart
  class OrderItem < ApplicationRecord
    belongs_to :item, polymorphic: true
    belongs_to :order

    scope :if_exist, -> (order, item) { where(order: order, item: item) }

    def self.exist_or_new order, book
      if_exist(order, book).first || OrderItem.new(quantity: 1)
    end

    def total
      quantity * price
    end
  end
end
