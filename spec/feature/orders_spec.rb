require 'rails_helper'

feature 'orders page' do
  before :all do
    @user = FactoryGirl.create(:user)
    @delivery = FactoryGirl.create(:shopping_cart_delivery)
    @order_in_queue = FactoryGirl.create(:shopping_cart_order_in_queue, user: @user, delivery: @delivery)
    @book = FactoryGirl.create(:book)
  end

  after :all do
    @book.delete
    @user.delete
  end

  before do
    sign_in @user
  end

  scenario 'open cart' do
    add_book @book
    visit shopping_cart.orders_path
    click_button(I18n.t('shopping_cart.go_to_cart'))
    expect(page).to have_css('a', I18n.t('shopping_cart.checkout'))
  end

  scenario 'open order' do
    visit_order_in_queue
    expect(current_path).to eq(shopping_cart.order_path(@order_in_queue.id))
  end
end

feature 'show order' do
  before :all do
    @user = FactoryGirl.create(:user)
    @delivery = FactoryGirl.create(:shopping_cart_delivery)
    @order_in_queue = FactoryGirl.create(:shopping_cart_order_in_queue, user: @user, delivery: @delivery)
    @book = FactoryGirl.create(:book)
  end

  before do
    sign_in @user
  end

  scenario 'back to orders' do
    visit_order_in_queue
    click_link(I18n.t('shopping_cart.back_to_orders'))
    expect(current_path).to eq(shopping_cart.orders_path)
  end
end

private

  def add_book book
    visit root_path
    expect(page).to have_content(book.title)
    click_link(book.title)
    expect(@user.current_order.order_items).to be_any
  end

  def visit_order_in_queue
    visit shopping_cart.orders_path
    click_link(@order_in_queue.id)
  end
