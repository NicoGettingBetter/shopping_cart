module ShoppingCart
  class OrderItemForm < Rectify::Form
    attribute :quantity, Integer
    attribute :order_id, Integer
    attribute :item_id, Integer
    attribute :item_type, String
    attribute :id, Integer

    validates :quantity,
              :order_id,
              :item_id,
              presence: true
    validates :quantity,
              numericality: { grater_then: 0 }
  end
end
