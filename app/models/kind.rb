class Kind < ActiveRecord::Base
  has_many :pokemon_kinds
  has_many :pokemons, through: :pokemon_kinds
end
