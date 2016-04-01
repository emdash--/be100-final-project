class Pokemon < ActiveRecord::Base
  has_many :pokemon_kinds
  has_many :kinds, through: :pokemon_kinds


  def self.search(search)
    where("poke_name LIKE ?", "%#{search}%")
  end

  def combined_type
    combined_type = ""

    self.kinds.each do |kind|
      combined_type = combined_type + kind.kind
    end
    combined_type
  end

  def effectiveness
    # DUAL TYPES #
    if (combined_type == "ElectricFlying" || combined_type == "FlyingElectric")
      "Ice: x2, Rock x2, Grass: 1/2, Fighting: 1/2, Flying: 1/2, Bug: 1/2, Steel: 1/2."
    elsif (combined_type == "BugFlying" || combined_type == "FlyingBug")
      "Fire: x2, Electric: x2, Ice: x2, Flying: x2, Rock: x4, Grass: 1/4, Fighting: 1/4, Bug: 1/2"
    elsif (combined_type == "FlyingNormal" || combined_type == "NormalFlying")
      "Electric: x2, Ice: x2, Rock: x2, Ground: 0, Ghost: 0, Grass: 1/2, Bug: 1/2"
    # SINGLE TYPES #
    elsif (combined_type == "Normal")
      "Fighting: x2, Ghost: 0"
    elsif (combined_type == "Fire")
      "Water: x2, Rock: x2, Ground: x2, Fire: 1/2, Grass: 1/2, Ice: 1/2, Bug: 1/2, Steel: 1/2, Fairy: 1/2"
    elsif (combined_type == "Water")
      "Electric: x2, Grass: x2, Fire: 1/2, Water: 1/2, Ice: 1/2, Steel: 1/2"
    elsif (combined_type == "Electric")
      "Ground: 2, Electric: 1/2, Flying: 1/2, Steel: 1/2"
    else
      "Uh oh, something went wrong here."
    end
  end


end
