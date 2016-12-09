Rails.application.routes.draw do
  resources :stores
  resources :items
  resources :teams
  resources :pokemons
  resources :gyms
  resources :trainers
  get "/", to:"home#index"
end
