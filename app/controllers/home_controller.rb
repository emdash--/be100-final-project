class HomeController < ApplicationController
  def index
    if params[:search]
      @pokemons = Pokemon.search(params[:search])
      render json: @pokemons.map(&:poke_name)
    else
      @pokemons = Pokemon.all
    end
  end
end
