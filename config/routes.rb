ShoppingCart::Engine.routes.draw do
  resources :orders, only: [:index, :edit, :update, :show, :destroy] do
    member do
      get 'addresses', action: 'edit_address', as: 'edit_address'
      get 'delivery', action: 'edit_delivery', as: 'edit_delivery'
      get 'payment', action: 'edit_payment', as: 'edit_payment'
      get 'confirm', action: 'edit_confirm', as: 'edit_confirm'
      get 'complete', action: 'complete', as: 'complete'
      put 'addresses', action: 'order_address', as: 'address'
      put 'delivery', action: 'order_delivery', as: 'delivery'
      put 'payment', action: 'order_payment', as: 'payment'
      put 'confirm', action: 'order_confirm', as: 'confirm'
    end
  end
  resources :order_items, only: [:create, :update, :destroy]
  root 'orders#index'
end
