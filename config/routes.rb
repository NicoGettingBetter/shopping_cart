ShoppingCart::Engine.routes.draw do
  resources :orders
  resources :order_items
  root 'orders#index'
end
