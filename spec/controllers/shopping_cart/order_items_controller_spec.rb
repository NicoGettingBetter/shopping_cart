require 'rails_helper'

module ShoppingCart
  RSpec.describe OrderItemsController, type: :controller do
    routes { ShoppingCart::Engine.routes }

    let(:book) { FactoryGirl.create(:book) }
    let(:book1) { FactoryGirl.create(:book) }
    let!(:order) { FactoryGirl.create(:shopping_cart_order, user: user) }
    let!(:user) { FactoryGirl.create(:user) }
    let!(:order_item) { FactoryGirl.create(:shopping_cart_order_item, order: order, item: book, quantity: 2) }

    let(:valid_attributes) {
      {
        item_type: 'Book',
        item_id: book.id,
        quantity: 2
      }
    }
    let(:valid1_attributes) {
      {
        item_type: 'Book',
        item_id: book1.id,
        quantity: 2
      }
    }

    let(:valid_session) { {} }

    describe "POST create" do
      describe "with valid params" do
        before do
          @request.env['HTTP_REFERER'] = "http://localhost:3000/item/#{book.id}"
          allow(request.env['warden']).to receive(:authenticate!).and_return(user)
          allow(controller).to receive(:current_user).and_return(user)
          allow(controller).to receive(:current_order).and_return(order)
        end

        it "creates a new OrderItem" do
          expect {
            post :create, params: { order_item: valid1_attributes}
          }.to change(OrderItem, :count).by(1)
        end

        it "doesn't create a new OrderItem" do
          expect {
            post :create, params: { order_item: valid_attributes}
          }.to change(OrderItem, :count).by(0)
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        let(:new_attributes) {
          {
            item_id: book.id,
            quantity: 3
          }
        }

        before do
          allow(request.env['warden']).to receive(:authenticate!).and_return(user)
          allow(controller).to receive(:current_user).and_return(user)
          allow(controller).to receive(:current_order).and_return(order)
        end

        it "updates the requested order item" do
          post :update, params: {id: order_item.id, order_item: new_attributes}
          order_item.reload
          expect(OrderItem.find(order_item.id).quantity).to eq(3)
        end
      end
    end

    describe "DELETE destroy" do
      before do
        @request.env['HTTP_REFERER'] = "http://test.host/shopping_cart/orders/#{order.id}/edit"
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
