Rails.application.routes.draw do
  root to: "static_pages#landing_page"  
  get "static_pages/kitUI"

  devise_for :users
  resources :users
  resources :products
  # Routes relatives aux product_category
  get 'product/category/:id', to: 'products#category', as: 'product_category'


  # Routes relatives aux product_carts
  resources :product_carts, only: [:create, :destroy]
  get 'product_carts/:id/add' => "product_carts#add_quantity", as: "product_cart_add"
  get 'product_carts/:id/reduce' => "product_carts#reduce_quantity", as: "product_cart_reduce"

  # Routes relatives aux carts et au payement Stripe
  resources :carts, only: [:show] do
    scope '/checkout' do
      post 'create', to: 'checkout#create', as: 'checkout_create'    
      get 'success', to: 'checkout#success', as: 'checkout_success'
      get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    end
  end

  resources :orders, only: [:create, :index, :show]

  #active storage
  resources :users, only: [:show] do
  resources :avatars, only: [:create]
  end
  
end
