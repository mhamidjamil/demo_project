Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  #project routes:
  # get 'projects/new', to: 'projects#new'
  resources :projects
  resources :users, except: [:new]
  resources :bugs
  


end
