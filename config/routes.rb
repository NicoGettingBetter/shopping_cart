ShoppingCart::Engine.routes.draw do
  resources :orders
  root 'orders#edit'
end
