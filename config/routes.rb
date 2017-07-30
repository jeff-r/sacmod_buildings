Rails.application.routes.draw do
  resources :architects
  devise_for :users
  root to: "architects#index"
end
