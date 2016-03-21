class PokemonKind < ActiveRecord::Base
  belongs_to :pokemon
  belongs_to :kind
end
