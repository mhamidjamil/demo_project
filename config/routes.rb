Rails.application.routes.draw do
  root 'pages#home'

  #project routes:
  # get 'projects/new', to: 'projects#new'
  resources :projects
  resources :users, except: [:new]
  resources :bugs
  
  get '/login', to: 'sessions#new'
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  get '/signup', to: 'users#new'


end
