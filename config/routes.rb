Rails.application.routes.draw do
  # resources :search_suggestions
  # get 'home/index'

  resources :pokemons
  root :to => "home#index"
  resources :pokemons do
    get :autocomplete_pokemon_poke_name, :on => :collection
  end
end
