module ShoppingCart
  class Order < ApplicationRecord
    include AASM

    aasm column: :state do
      state :in_progress, initial: true
      state :in_queue
      state :in_delivery
      state :delivered
      state :canceled

      event :place do
        transitions from: :in_progress, to: :in_queue
      end

      event :deliver do
        transitions from: :in_queue, to: :in_delivery
      end

      event :shipped do
        transitions from: :in_delivery, to: :delivered
      end

      event :cancel do
        transitions from: :in_queue, to: :canceled
      end
    end

    belongs_to :user, polymorphic: true
    has_one :credit_card
    belongs_to :billing_address, class_name: 'Address', optional: true
    belongs_to :shipping_address, class_name: 'Address', optional: true
    has_many :order_items, dependent: :destroy
    has_one :coupon
    belongs_to :delivery, optional: true

    [:subtotal,
      :total,
      :sale,
      :delivery_price].each do |method|
        define_method(method) do
          OrderCalculator.call(self).public_send(method)
        end
      end

    def empty?
      order_items.empty?
    end
  end
end
