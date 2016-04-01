Rails.application.routes.draw do

  resources :search_suggestions
  get 'home/index'

  resources :pokemons
  root :to => "home#index"
  
end
