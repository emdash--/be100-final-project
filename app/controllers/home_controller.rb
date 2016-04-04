class HomeController < ApplicationController
  autocomplete :pokemon, :poke_name
  
  def index
    if params[:search]
      @pokemons = Pokemon.search(params[:search])
    else
      @pokemons = Pokemon.all
    end
  end
end
