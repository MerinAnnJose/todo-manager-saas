Rails.application.routes.draw do

  get  "/" => "home#index"
  
  resources :todos

  resources :users

  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
