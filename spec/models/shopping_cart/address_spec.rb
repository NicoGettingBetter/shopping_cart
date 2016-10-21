require 'rails_helper'

module ShoppingCart
  RSpec.describe Address, type: :model do
    [:first_name,
      :last_name,
      :street,
      :zipcode,
      :city,
      :phone,
      :country_id].each do |field|
        it { should have_db_column(field) }
      end

    it { should belong_to(:country) }

    it 'has valid factory' do
      expect(FactoryGirl.build(:shopping_cart_address)).to be_valid
    end
  end
end
