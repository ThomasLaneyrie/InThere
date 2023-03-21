Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "static_pages#landing_page"  
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
