module ShoppingCart
  class SetOrUpdateOrderItem < BaseCommand
    def name
      :set_or_update_order_item
    end

    private

      def set_or_update_order_item
        if order_items.any?
          @form.quantity += order_item.quantity
          @form.quantity = item_instock if item_instock < @form.quantity
          order_item.update(quantity: @form.quantity)
        else
          OrderItem.create(attributes)
        end
      end

      def order_items
        order.order_items.select{ |order_item| order_item.item_id == item_id }
      end

      def order_item
        order_items.first
      end

      def order
        Order.find @form.order_id
      end

      def attributes
        @form.attributes
      end

      def item_id
        @form.item_id
      end

      def item_instock
        Item.find(item_id).instock
      end
  end
end
