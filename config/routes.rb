Rails.application.routes.draw do
  root to: "architects#index"

  resources :buildings
  resources :architects
  resources :image

  get 'search/multisearch'
  get "/users/admin" => "admin#index"
  post "/users/admin" => "admin#update"

  devise_for :users
end
