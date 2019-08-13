Rails.application.routes.draw do


  get '/login', to: "sessions#new"

  post '/login', to: "sessions#create"

  get '/signup', to: "users#new"

  root 'sessions#new'

  resources :users, only: [:new, :create, :show]
  resources :events, except: [:destroy, :edit, :update]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
