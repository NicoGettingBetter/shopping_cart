Rails.application.routes.draw do
  devise_for :users
  mount ShoppingCart::Engine => "/shopping_cart"
  root 'home#index'
  get 'add_book/:book_id', to: 'home#add_book', as: :add_book
end
