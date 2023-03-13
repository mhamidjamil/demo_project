Rails.application.routes.draw do
  devise_for :views
  root 'pages#home'
     
  # delete '/users/sign_out', to: "sessions#destroy"
  # delete '/sign_out', to: "sessions#destroy"
  # devise_for :users do
    # get 'logout' => 'devise/sessions#destroy'
  # end

  devise_for :users
  # do get '/users/sign_out' => 'devise/sessions#destroy' 
  # end
  #project routes:
  # get 'projects/new', to: 'projects#new'
  resources :projects
  resources :users, except: [:new, :destroy, :DELETE]
  resources :bugs

end
