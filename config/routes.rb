TiRefdata::Engine.routes.draw do
  resources :countries, only: [:index, :show]
  resources :airlines, only: [:index, :show]
  resources :aircraft, only: [:index, :show]
  resources :airports, only: [:index, :show]
  resources :buses, only: [:index, :show]
  resources :heliports, only: [:index, :show]
  resources :ports, only: [:index, :show]
  resources :railways, only: [:index, :show]
  resources :offlines, only: [:index, :show]
  resources :cities, only: [:index, :show]
end
