Rails.application.routes.draw do
  get 'movies/new'
  get 'movies/create'
  get 'movies/show'
  get 'movies/edit'
  get 'movies/update'
  get 'movies/destroy'
  get 'movies/index'

  root "users#wellcome"
  resources :users
  resources :theatres
  resources :screens

  get '/customer', to: 'users#customer'
  get '/owner', to: 'users#owner'
  post 'login', to: 'application#login'
  delete 'logout', to: 'application#logout'
  get 'search_theatre_by_movie', to: 'theatres#search_theatre_by_movie'
  get 'search_screen_by_theatre', to: 'screens#search_screen_by_theatre'


end
