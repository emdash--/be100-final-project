class PokemonsController < ApplicationController
  def index
   @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    # @combined_type = @pokemon.kinds.combined_type
    # @effectiveness = @pokemon.kinds.move_effectiveness
  end

  private

  def pokemon_params
    params.required(:pokemon).permit(:id, :poke_number, :poke_name, :poke_type1, :poke_type2)
  end
end
