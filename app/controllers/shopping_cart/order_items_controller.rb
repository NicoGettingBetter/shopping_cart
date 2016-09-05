require_dependency "shopping_cart/application_controller"

module ShoppingCart
  class OrderItemsController < ApplicationController
    load_and_authorize_resource

    def destroy
      set_order_item
      @order_item.destroy
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
      end
    end

    private

      def set_order_item
        @order_item = OrderItem.find(params[:id])
      end
  end
end
