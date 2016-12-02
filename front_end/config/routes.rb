Rails.application.routes.draw do
  resources :trainers
  get "/", to:"home#index"
end
