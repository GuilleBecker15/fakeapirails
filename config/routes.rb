Rails.application.routes.draw do
  resources :posts
  resources :comments
  resources :albums
  resources :photos
  resources :users
get '/dbs', to: 'users#dbs', as: 'dbs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
