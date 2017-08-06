Rails.application.routes.draw do
  resources :buildings
  resources :architects
  devise_for :users
  root to: "architects#index"
  resources :image

  get "/users/admin" => "admin#index"
  post "/users/admin" => "admin#update"
end
