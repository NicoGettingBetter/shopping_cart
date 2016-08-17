require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :state => "MyString",
      :total_price => 1.5,
      :user => nil,
      :billing_address => nil,
      :shipping_address => nil,
      :coupon => nil,
      :delivery => nil
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input#order_state[name=?]", "order[state]"

      assert_select "input#order_total_price[name=?]", "order[total_price]"

      assert_select "input#order_user_id[name=?]", "order[user_id]"

      assert_select "input#order_billing_address_id[name=?]", "order[billing_address_id]"

      assert_select "input#order_shipping_address_id[name=?]", "order[shipping_address_id]"

      assert_select "input#order_coupon_id[name=?]", "order[coupon_id]"

      assert_select "input#order_delivery_id[name=?]", "order[delivery_id]"
    end
  end
end
