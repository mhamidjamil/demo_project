Rails.application.routes.draw do
  root 'pages#home'

  #project routes:
  # get 'projects/new', to: 'projects#new'
  resources :projects
  resources :users, except: [:new]

  get '/signup', to: 'users#new'

end
