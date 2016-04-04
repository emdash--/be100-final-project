class Kind < ActiveRecord::Base
  attr_accessor :move_effectiveness
  attr_accessor :pokemon

  has_many :pokemon_kinds
  has_many :pokemons, through: :pokemon_kinds

end
