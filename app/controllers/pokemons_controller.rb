class PokemonsController < ApplicationController
  def index
   @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  private

  def pokemon_params
    params.required(:pokemon).permit(:poke_number, :poke_name, :poke_type1, :poke_type2)
  end
end
