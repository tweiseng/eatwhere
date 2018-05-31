Rails.application.routes.draw do
  resources :users, except: [:new]
  resources :restaurants, except: [:create] 
	resources :shortlists
  



  root 'home#index'
  
  post "/signin" =>"sessions#create"
  get "/signin" =>"sessions#new"
  get "/signout" => "sessions#destroy"
  get "/signup" => "users#new"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  post "/restaurant" =>"restaurants#create", as: :saverest
  post "/search" =>"locations#search"
  delete "/location/:id"=>"locations#delete", as: :locdel
  get "/locations" =>"locations#index"
  get "/locations/new"=>"locations#new"
  post "/locations"=>"locations#create"
  post "/findlist"=>"shortlists#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
