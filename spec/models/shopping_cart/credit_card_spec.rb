require 'rails_helper'

module ShoppingCart
  RSpec.describe CreditCard, type: :model do
    [:number,
      :cvv,
      :expiration_month,
      :expiration_year,
      :order_id].each do |field|
        it { should have_db_column(field) }
      end

    it { should belong_to(:order) }

    it 'has valid factory' do
      expect(FactoryGirl.build(:shopping_cart_coupon)).to be_valid
    end
  end
end
