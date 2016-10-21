require 'rails_helper'

module ShoppingCart
  RSpec.describe Coupon, type: :model do
    [:code,
      :sale,
      :order_id].each do |field|
        it { should have_db_column(field) }
      end

    [:code,
      :sale].each do |field|
        it { should validate_presence_of(field) }
      end

    it { should belong_to(:order) }

    it 'has valid factory' do
      expect(FactoryGirl.build(:shopping_cart_coupon)).to be_valid
    end
  end
end
