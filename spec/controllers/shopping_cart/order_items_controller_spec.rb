require 'rails_helper'

module ShoppingCart
  RSpec.describe OrdersController, type: :controller do
    routes { ShoppingCart::Engine.routes }

    let(:book) { FactoryGirl.create(:book) }
    let!(:order) { FactoryGirl.create(:shopping_cart_order, user: user) }
    let!(:user) { FactoryGirl.create(:user) }
    let!(:order_item) { FactoryGirl.create(:shopping_cart_order_item, order: order, item: book, quantity: 2) }

    let(:valid_session) { {} }

    describe "DELETE destroy" do
      before do
        allow(request.env['warden']).to receive(:authenticate!).and_return(user)
        allow(controller).to receive(:current_user).and_return(user)
        allow(controller).to receive(:current_order).and_return(order)
      end

      it "destroys the requested order" do
        expect {
          delete :destroy, params: {id: order_item.to_param}
        }.to change(OrderItem, :count).by(-1)
      end

      it "re-renders the :order template" do
        delete :destroy, params: {id: order_item.to_param}
        expect(response).to redirect_to(edit_order_path(order.id))
      end
    end
  end
end
