Rails.application.routes.draw do

  root "users#wellcome"

  resources :users
  resources :theatres
  resources :screens
  resources :movies
  resources :tickets


  get 'front', to: 'users#front'

  post 'login', to: 'application#login'
  delete 'logout', to: 'application#logout'
  get 'search_theatre_by_movie', to: 'theatres#search_theatre_by_movie'
  get 'search_screen_by_theatre', to: 'screens#search_screen_by_theatre'
  get 'available_movie', to: 'movies#available_movie'


end
