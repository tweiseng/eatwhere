Rails.application.routes.draw do
  resources :users, except: [:new]
  root 'home#index'
  
  post "/signin" =>"sessions#create"
  get "/signin" =>"sessions#new"
  get "/signout" => "sessions#destroy"
  get "/signup" => "users#new"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
