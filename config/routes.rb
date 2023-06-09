Rails.application.routes.draw do
  resources :comments

  root to: "static_pages#landing_page"  
  get "static_pages/kitUI"

  # Routes relatives aux users
  devise_for :users, :controllers => {omniauth_callbacks: 'users/omniauth_callbacks'}
  resources :users

  # Routes relatives aux administrateurs
  namespace :admin do
    root to: "static_pages#dashboard"
    resources :products, only: [:index,:edit, :destroy]
    resources :users do
      resources :comments, only: [:index]
    end
    resources :orders, only:  [:index, :show, :destroy]
    resources :categories
  end

  # Routes relatives aux produits
  resources :products, param: "title"

  # Routes relatives aux product_carts
  resources :product_carts, only: [:create, :destroy]
  post 'product_carts/:id/add' => "product_carts#add_quantity", as: "product_cart_add"
  post 'product_carts/:id/reduce' => "product_carts#reduce_quantity", as: "product_cart_reduce"

  # Routes relatives aux category
  resources :categories, only: [:show]

  # Routes relatives aux carts et au payement Stripe
  resources :carts, only: [:show] do
    scope '/checkout' do
      post 'create', to: 'checkout#create', as: 'checkout_create'    
      get 'success', to: 'checkout#success', as: 'checkout_success'
      get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    end
  end

  # Routes relatives aux orders
  resources :orders, only: [:create, :index, :show]

  #active storage
  resources :users, only: [:show] do
  resources :avatars, only: [:create]
  end
  
  # Pour la barre de recherche
  get 'search', to: "search#index"

  # Routes relatives aux wishlists et product_wishlists
  resources :wishlists, only: [:new, :create, :show, :update, :destroy]
  resources :product_wishlists, only: [:destroy]
end

