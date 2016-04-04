class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  private

  def pokemon_params
    params.required(:pokemon).permit(:id, :poke_name)
  end
end
