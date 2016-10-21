require 'rails_helper'

feature 'edit cart' do
  include ActiveSupport::NumberHelper

  before :all do
    @coupon = ShoppingCart::Coupon.create(FactoryGirl.attributes_for(:shopping_cart_coupon))
    @user = FactoryGirl.create(:user)
    @book = FactoryGirl.create(:book)
  end
  let!(:order) { @user.current_order }

  after :all do
    @book.delete
    @user.delete
  end

  before do
    sign_in @user
    add_book @book
  end

  after do
    empty_cart
  end

  scenario 'update order item' do
    update_order_item(2)
    expect(page).to have_content((@book.price*2).to_s)
  end

  scenario 'add coupon' do
    add_coupon @coupon.code
    expect(page).to have_content(I18n.t('shopping_cart.sale'))
  end

  scenario 'wrong coupon' do
    add_coupon '0000'
    expect(page).to have_content('error')
  end

  scenario 'move to shop' do
    click_link(I18n.t('shopping_cart.cart'))
    click_link I18n.t('shopping_cart.continue_shopping')
    expect(page).to have_content(I18n.t('shopping_cart.cart'))
  end

  scenario 'delete order item' do
    click_link(I18n.t('shopping_cart.cart'))
    click_link 'x'
    sleep 1
    expect(@user.current_order.order_items).not_to be_any
    add_book @book
  end

  scenario 'delete order' do
  end
end

feature 'checkout' do
  before :all do
    @country = FactoryGirl.create(:shopping_cart_country)
    @user = FactoryGirl.create(:user)
    @delivery = FactoryGirl.create(:shopping_cart_delivery)
    @book = FactoryGirl.create(:book)
  end

  after :all do
    @book.delete
    @user.delete
  end

  before do
    sign_in @user
    add_book @book
    go_to_checkout
  end

  after do
    empty_cart
  end

  feature 'address' do
    scenario 'set addresses' do
      set_address
      expect(page).to have_content(@delivery.company)
    end

    scenario 'set same addresses' do
      fill_in_billing_address
      check :use_billing_address_check
      click_button I18n.t('shopping_cart.save_and_continue')
      sleep 1
      expect(@user.current_order.billing_address).not_to be_nil
    end

    scenario 'with wrong fields' do
      click_button I18n.t('shopping_cart.save_and_continue')
      expect(page).to have_content('error')
    end
  end

  feature 'delivery' do
    before do
      set_address
    end

    scenario 'set delivery' do
      set_delivery
      sleep 1
      expect(@user.current_order.delivery).not_to be_nil
    end

    scenario 'was not chosen' do
      click_button I18n.t('shopping_cart.save_and_continue')
      expect(page).to have_content('error')
    end
  end

  feature 'payment' do
    before do
      set_address
      set_delivery
    end

    scenario 'set payment' do
      set_payment
      sleep 1
      expect(@user.current_order.credit_card).not_to be_nil
    end

    scenario 'with wrong fields' do
      click_button I18n.t('shopping_cart.save_and_continue')
      expect(page).to have_content('error')
    end
  end

  feature 'confirm' do
    before do
      set_address
      set_delivery
      set_payment
    end

    scenario 'place order' do
      click_button I18n.t('shopping_cart.save_and_continue')
      click_button I18n.t('shopping_cart.place_order')
      sleep 1
      expect(@user.current_order.order_items).not_to be_any
      add_book @book
    end
  end
end

private

  def update_order_item count
    click_link(I18n.t('shopping_cart.cart'))
    fill_in "order_order_items_#{@book.order_items.first.id}_quantity", with: count
    click_button(I18n.t('shopping_cart.update'))
  end

  def add_book book
    visit root_path
    click_link(book.title)
    expect(page).to have_content('Cart')
  end

  def add_coupon code
    click_link(I18n.t('shopping_cart.cart'))
    fill_in 'order_coupon', with: code
    click_button(I18n.t('shopping_cart.update'))
  end

  def go_to_checkout
    click_link I18n.t('shopping_cart.cart')
    click_link I18n.t('shopping_cart.checkout')
  end

  def fill_in_billing_address
    fill_in 'billing_address_first_name', with: 'name'
    fill_in 'billing_address_last_name', with: 'name'
    fill_in 'billing_address_street', with: 'street'
    fill_in 'billing_address_city', with: 'city'
    select @country.name, from: 'billing_address_country_id'
    fill_in 'billing_address_zipcode', with: '123'
    fill_in 'billing_address_phone', with: '+380111111111'
  end

  def fill_in_shipping_address
    fill_in 'shipping_address_first_name', with: 'name'
    fill_in 'shipping_address_last_name', with: 'name'
    fill_in 'shipping_address_street', with: 'street'
    fill_in 'shipping_address_city', with: 'city'
    select @country.name, from: 'shipping_address_country_id'
    fill_in 'shipping_address_zipcode', with: '123'
    fill_in 'shipping_address_phone', with: '+380111111111'
  end

  def set_address
    fill_in_billing_address
    fill_in_shipping_address
    click_button I18n.t('shopping_cart.save_and_continue')
  end

  def empty_cart
    visit root_path
    click_link(I18n.t('shopping_cart.cart'))
    click_link I18n.t('shopping_cart.empty_cart')
    expect(page).to have_content(I18n.t('shopping_cart.you_have_an_empty_cart'))
  end

  def set_delivery
    choose :"order_shipping_#{@delivery.id}"
    click_button I18n.t('shopping_cart.save_and_continue')
  end

  def set_payment
    fill_in :credit_card_number, with: '1234123412341234'
    select 'May', from: :credit_card_expiration_month
    select '2017', from: :credit_card_expiration_year
    fill_in :credit_card_cvv, with: '123'
    click_button I18n.t('shopping_cart.save_and_continue')
  end
