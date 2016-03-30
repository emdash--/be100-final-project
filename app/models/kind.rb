class Kind < ActiveRecord::Base
  attr_accessor :move_effectiveness
  attr_accessor :pokemon

  has_many :pokemon_kinds
  has_many :pokemons, through: :pokemon_kinds



  private
  def pokemon_params
    params.required(:pokemon).permit(:poke_number, :poke_name, :poke_type1, :poke_type2, :id)
  end

end


#Using this approach you would use programming logic to determine the attack damage
# here you would need to know two things: the combinedType of your pokemon and the type that is attacking you
# using those two pieces of information you would use if statements to replicate the logic
# thats what the `processResult` method does
# I would try it out with a small part of your grid
# and if it works, then you can go through the process of incorporating all of the combinations
# this is just one approach
# in your code you could do the following

# pokemon = Kind.first
# lets assume this pokemen has type1 = "Fire" and type = "Water"

# pokemon.attackedBy("Fire")
# => "1/2"
