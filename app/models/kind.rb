class Kind < ActiveRecord::Base
  has_many :pokemon_kinds
  has_many :pokemons, through: :pokemon_kinds


=begin
  def attackedBy(type) 
   processResult(self.combined_type, type) 
  end
  
​
  def combined_type
   self.kind1 + self.kind2
  end
​
  def processResult(combinedType, attackedByType)
    # example of a condition, you will have lots of these
    if (combinedType == “FireWater” || combinedType == "WaterFire") && attackedByType == “Fire"
      “1/2"
    elsif (another condition)
    elsif (another condition)
    else
   end
  end
=end

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
