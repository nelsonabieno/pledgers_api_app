Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :admin
  resources :project

  resources :contributor do
    resources :payment
    # resources :project, :controller => "pledge"
  end

  resources :account do
    resources :contributor
  end

  resources :pledge


  post 'login', to: 'authentication#authenticate'
  get 'logout', to: 'authentication#destroy'
  post '/account/contributor/:id', to: 'account#create'
end
