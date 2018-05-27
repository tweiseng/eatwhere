Rails.application.routes.draw do
  resources :users
  root 'home#index'
  
  get '/signin' =>'users#sign'
  post '/signin' =>'users#session'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
