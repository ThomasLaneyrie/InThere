Rails.application.routes.draw do
  root to: "static_pages#landing_page"  
  get "static_pages/kitUI"

  devise_for :users
  resources :users, only: [:show, :destroy]
  resources :products

  # Routes relatives aux product_carts
  resources :product_carts, only: [:create, :destroy]
  get 'product_carts/:id/add' => "product_carts#add_quantity", as: "product_cart_add"
  get 'product_carts/:id/reduce' => "product_carts#reduce_quantity", as: "product_cart_reduce"

  # Routes relatives aux carts
  get 'carts/:id', to: 'carts#show', as: 'panier'
  resources :carts, only: [:show]
end
