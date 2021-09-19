Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :admin
  post 'login', to: 'authentication#authenticate'
  get 'logout', to: 'authentication#destroy'
end
