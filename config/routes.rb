Rails.application.routes.draw do
  resources :buildings
  resources :architects
  devise_for :users
  root to: "architects#index"
  resources :image
end
