Rails.application.routes.draw do

  get 'home/index'

  resources :pokemons
  root :to => "home#index"
  
end
