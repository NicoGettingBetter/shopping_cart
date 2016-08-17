require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :state => "State",
        :total_price => 2.5,
        :user => nil,
        :billing_address => nil,
        :shipping_address => nil,
        :coupon => nil,
        :delivery => nil
      ),
      Order.create!(
        :state => "State",
        :total_price => 2.5,
        :user => nil,
        :billing_address => nil,
        :shipping_address => nil,
        :coupon => nil,
        :delivery => nil
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
