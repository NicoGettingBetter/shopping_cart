require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :state => "MyString",
      :total_price => 1.5,
      :user => nil,
      :billing_address => nil,
      :shipping_address => nil,
      :coupon => nil,
      :delivery => nil
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

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
