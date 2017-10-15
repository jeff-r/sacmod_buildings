Rails.application.routes.draw do
  root to: "architects#index"

  resources :buildings
  resources :architects
  resources :image

  get 'search/multisearch'
  get 'buildings/:id/versions', to: 'buildings#show_versions', as: 'building_versions'
  get "/users/admin" => "admin#index"
  post "/users/admin" => "admin#update"

  devise_for :users
end
