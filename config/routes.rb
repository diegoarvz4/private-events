Rails.application.routes.draw do

  get 'events_controller/new'

  get 'events_controller/index'

  get 'events_controller/show'

  get 'events_controller/create'

  get '/login', to: "sessions#new"

  post '/login', to: "sessions#create"

  get '/signup', to: "users#new"

  root 'sessions#new'

  resources :users, only: [:new, :create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
