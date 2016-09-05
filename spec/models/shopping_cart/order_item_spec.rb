require 'rails_helper'

module ShoppingCart
  RSpec.describe OrderItem, type: :model do
    [:price,
      :quantity,
      :order_id,
      :item_id].each do |field|
        it { should have_db_column(field) }
      end

      [:order,
        :item].each do |field|
          it { should belong_to(field) }
        end

    it 'has valid factory' do
      expect(FactoryGirl.build(:shopping_cart_order_item)).to be_valid
    end
  end
end
