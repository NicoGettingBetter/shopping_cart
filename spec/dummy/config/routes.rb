Rails.application.routes.draw do
  devise_for :users
  resources :orders, module: :shopping_cart, only: [] do
    member do
      get 'my_step', action: 'edit_my_step', as: 'edit_my_step'
      put 'my_step', action: 'my_step', as: 'my_step'
    end
  end
  mount ShoppingCart::Engine => "/shopping_cart"
  root 'home#index'
  get 'add_book/:book_id', to: 'home#add_book', as: :add_book
end
