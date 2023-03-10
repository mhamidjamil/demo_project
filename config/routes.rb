Rails.application.routes.draw do
  devise_for :devs
  root 'pages#home'

  #project routes:
  # get 'projects/new', to: 'projects#new'
  resources :projects
  resources :devs, except: [:new]
  resources :bugs

end
