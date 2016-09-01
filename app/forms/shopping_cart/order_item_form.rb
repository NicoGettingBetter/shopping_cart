module ShoppingCart
  class OrderItemForm < Rectify::Form
    attribute :price, Float
    attribute :quantity, Integer
    attribute :order_id, Integer
    attribute :item_id, Integer
    attribute :id, Integer

    validates :quantity,
              :order_id,
              :item_id,
              presence: true
    validates :quantity,
              numericality: { grater_then: 0 }

    def set_price
      @price = Item.find(item_id).price
    end
  end
end
