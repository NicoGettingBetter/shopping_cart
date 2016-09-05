require 'rails_helper'

module ShoppingCart
  RSpec.describe Country, type: :model do
    it { should have_db_column(:name) }
    it { should validate_presence_of(:name) }
    it { should have_many(:addresses) }
    it 'has valid factory' do
      expect(FactoryGirl.build(:shopping_cart_country)).to be_valid
    end
  end
end
