require 'rails_helper'

feature 'add book to cart' do
  before :all do
    @user = FactoryGirl.create(:user)
    @book = FactoryGirl.create(:book)
  end

  scenario 'add book' do
    sign_in @user
    add_book @book
    empty_cart
  end
end

private

  def add_book book
    visit root_path
    expect(page).to have_content(book.title)
    click_link(book.title)
    expect(@user.current_order.order_items).to be_any
  end

  def empty_cart
    click_link(I18n.t('shopping_cart.cart'))
    click_link I18n.t('shopping_cart.empty_cart')
    expect(page).to have_content(I18n.t('shopping_cart.you_have_an_empty_cart'))
  end
