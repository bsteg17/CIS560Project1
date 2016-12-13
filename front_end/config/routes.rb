Rails.application.routes.draw do
  resources :cities
  resources :stores
  resources :items
  resources :teams
  resources :pokemons
  resources :gyms
  resources :trainers
  get "/", to:"home#index"
end
