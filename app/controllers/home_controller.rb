class HomeController < ApplicationController
  def index
    if params[:search]
      @pokemons = Pokemon.search(params[:search])
    else
      @pokemons = Pokemon.all
    end
  end
end
