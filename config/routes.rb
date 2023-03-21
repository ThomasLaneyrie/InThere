Rails.application.routes.draw do
  resources :products
  get 'users/show'
  get 'users/edit'
  get 'users/update'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "static_pages#landing_page"  
  devise_for :users

end
