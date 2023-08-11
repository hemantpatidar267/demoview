Rails.application.routes.draw do
  root "users#wellcome"
  resources :users
  get '/customer', to: 'users#customer'
  get '/owner', to: 'users#owner'
  post 'login', to: 'application#login'
  delete 'logout', to: 'application#logout'


end
