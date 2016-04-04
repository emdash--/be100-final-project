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
    elsif (combined_type == "NormalFire" || combined_type == "FireNormal")
      "Water: x2, Fighting: x2, Ground: x2, Fire: 1/2, Grass: 1/2, Ice: 1/2, Bug: 1/2, Steel: 1/2, Fairy: 1/2, Ghost: 0"
    elsif (combined_type == "NormalWater" || combined_type == "WaterNormal")
      "Electric: x2, Grass: x2, Fighting: x2, Fire: 1/2, Water: 1/2, Ice: 1/2, Ghost: 0"
    elsif (combined_type == "NormalElectric" || combined_type == "NormalElectric")
      "Fighting: x2, Ground: x2, Electric: 1/2, Flying: 1/2, Steel: 1/2, Ghost: 0"
    elsif (combined_type == "NormalGrass" || combined_type == "GrassNormal")
      "Fire: x2, Ice: x2, Fighting: x2, Poison: x2, Flying: x2, Bug: x2, Water: 1/2, Electric: 1/2, Grass: 1/2, Ground: 1/2, Ghost: 0"
    elsif (combined_type == "NormalFighting" || combined_type == "FightingNormal")
      "Fighting: x2, Flying: x2, Psychic: x2, Fairy: x2, Bug: 1/2, Rock: 1/2, Dark: 1/2, Ghost: 0"
    elsif (combined_type == "NormalGround" || combined_type == "GroundNormal")
      "Water: 2, Grass: 2, Ice: 2, Fighting: 2, Poison: 1/2, Rock: 1/2, Electric: 0, Ghost: 0"
    elsif (combined_type == "NormalPsychic" || combined_type == "PsychicNormal")
      "Bug: x2, Dark: x2, Psychic: 1/2, Ghost: 0"
    elsif (combined_type == "NormalFairy" || combined_type == "FairyNormal")
      "Ground: x2, Fairy: x2, Bug: 1/2, Dark: 1/2, Ghost: 0, Dragon: 0"
    elsif (combined_type == "FireWater" || combined_type == "WaterFire")
      "Electric: x2, Ground: x2, Rock: x2, Bug: 1/2, Fairy: 1/2, Fire: 1/4, Ice: 1/4, Steel: 1/4"
    elsif (combined_type == "FireElectric" || combined_type == "ElectricFire")
      "Ground: x4, Water: x2, Rock: x2, Fire: 1/2, Electric: 1/2, Grass: 1/2, Ice: 1/2, Flying: 1/2, Bug: 1/2, Fairy: 1/2, Steel: 1/4"
    elsif (combined_type == "FireFighting" || combined_type == "FightingFire")
      "Water: x2, Ground: x2, Flying: x2, Psychic: x2, Fire: 1/2, Grass: 1/2, Ice: 1/2, Dark: 1/2, Steel: 1/2, Bug: 1/4"
    elsif (combined_type == "FireGround" || combined_type == "GroundFire")
      "Water: x4, Ground: x2, Fire: 1/2, Poison: 1/2, Bug: 1/2, Steel: 1/2, Fairy: 1/2, Electric: 0"
    elsif (combined_type == "FireFlying" || combined_type == "FlyingFire")
      "Rock: x4, Water: x2, Electric: x2, Fire: 1/2, Fighting: 1/2, Steel: 1/2, Fairy: 1/2, Grass: 1/4, Bug: 1/4, Ground: 0"
    elsif (combined_type == "FirePsychic" || combined_type == "PsychicFire")
      "Water: x2, Ground: x2, Rock: x2, Ghost: x2, Dark: x2, Fire: 1/2, Grass: 1/2, Ice: 1/2, Fighting: 1/2, Psychic: 1/2, Steel: 1/2, Fairy: 1/2"
    elsif (combined_type == "FireBug" || combined_type == "BugFire")
      "Rock: x4, Water: x2, Flying: x2, Ice: 1/2, Fighting: 1/2, Bug: 1/2, Steel: 1/2, Fairy: 1/2, Grass: 1/4"
    elsif (combined_type == "FireRock" || combined_type == "RockFire")
      "Water: x4, Fighting: x2, Rock: x2, Normal: 1/2, Ice: 1/2, Poison: 1/2, Flying: 1/2, Fairy: 1/2, Fire: 1/4"
    elsif (combined_type == "FireGhost" || combined_type == "GhostFire")
      "Water: x2, Ground: x2, Rock: x2, Ghost: x2, Dark: x2, Fire: 1/2, Grass: 1/2, Ice: 1/2, Poison: 1/2, Steel: 1/2, Fairy: 1/2, Normal: 0, Fighting: 0, Bug: 1/4"
    elsif (combined_type == "FireDragon" || combined_type == "DragonFire")
      "Fire: 1/4, Electric: 1/2, Grass: 1/4, Ground: x2, Bug: 1/2, Rock: x2, Dragon: x2, Steel: 1/2"
    elsif (combined_type == "FireDark" || combined_type == "DarkFire")
      "Fire: 1/2, Water: x2, Grass: 1/2, Ice: 1/2, Fighting: x2, Ground: x2, Psychic: 0, Rock: x2, Ghost: 1/2, Dark: 1/2, Steel: 1/2"
    elsif (combined_type == "FireSteel" || combined_type == "SteelFire")
      "Norma: 1/2, Water x2, Grass: 1/4, Ice: 1/4, Fighting: x2, Poison: 0, Ground x4,, Flying: 1/2, Psychic: 1/2, Bug: 1/4, Dragon: 1/2, Steel: 1/4, Fairy: 1/4"
    elsif (combined_type == "WaterElectric" || combined_type == "ElectricWater")
      "Fire: 1/2, Water: 1/2, Grass: x2, Ice: 1/2, Ground: x2, Flying: 1/2, Steel: 1/4"
    elsif (combined_type == "WaterGrass" || combined_type == "GrassWater")
      "Water: 1/4, Poison: x2, Ground: 1/2, Flying: x2, Bug: x2, Steel: 1/2"
    elsif (combined_type == "WaterIce" || combined_type == "IceWater")
      "Water: 1/2, Electric: x2, Grass: x2, Ice: 1/4, Fighting: x2, Rock: x2"
    elsif (combined_type == "WaterFighting" || combined_type == "FightingWater")
      "Fire: 1/2, Water: 1/2, Electric: x2, Grass: x2, Ice: 1/2, Flying: x2, Psychic: x2, Bug: 1/2, Rock: 1/2, Dark: 1/2, Steel: 1/2, Fairy: x2"
    elsif (combined_type == "WaterPoison" || combined_type == "PoisonWater")
      "Fire: 1/2, Water: 1/2, Electric: x2, Ice: 1/2, Fighting: 1/2, Poison: 1/2, Ground: x2, Psychic: x2, Bug: 1/2, Steel: 1/2, Fairy: 1/2"
    elsif (combined_type == "WaterGround" || combined_type == "GroundWater")
      "Fire: 1/2, Water: 1/2, Electric: 0, Grass: 4, Poison: 1/2, Rock: 1/2, Steel: 1/2"
    elsif (combined_type == "WaterFlying" || combined_type == "FlyingWater")
      "Fire: 1/2, Water: 1/2, Electric: x4, Fighting: 1/2, Ground: 0, Bug: 1/2, Rock: x2, Steel: 1/2"
    # SINGLE TYPES #
    elsif (combined_type == "Normal")
      "Fighting: x2, Ghost: 0"
    elsif (combined_type == "Fire")
      "Water: x2, Rock: x2, Ground: x2, Fire: 1/2, Grass: 1/2, Ice: 1/2, Bug: 1/2, Steel: 1/2, Fairy: 1/2"
    elsif (combined_type == "Water")
      "Electric: x2, Grass: x2, Fire: 1/2, Water: 1/2, Ice: 1/2, Steel: 1/2"
    elsif (combined_type == "Electric")
      "Ground: 2, Electric: 1/2, Flying: 1/2, Steel: 1/2"
    elsif (combined_type == "Grass")
      "Fire: x2, Ice: x2, Poison: x2, Flying: x2, Bug: x2,  Water: 1/2, Electric: 1/2, Grass: 1/2, Ground: 1/2"
    elsif (combined_type == "Ice")
      "Fire: x2, Fighting: x2, Rock: x2, Steel: x2, Ice: 1/2"
    elsif (combined_type == "Fighting")
      "Flying: x2, Psychic: x2, Fairy: x2, Bug: 1/2, Rock: 1/2, Dark: 1/2"
    elsif (combined_type == "Poison")
      "Ground: x2, Psychic: x2, Grass: 1/2, Fighting: 1/2, Poison: 1/2, Bug: 1/2, Fairy: 1/2"
    elsif (combined_type == "Ground")
      "Water: x2, Grass: x2, Ice: x2, Ground: x2, Psychic: x2, Poison: 1/2, Rock: 1/2, Electric: 0"
    elsif (combined_type == "Flying")
      "Electric: x2, Ice: x2, Rock: x2, Grass: 1/2, Fighting: 1/2, Bug: 1/2, Ground: 0"
    elsif (combined_type == "Psychic")
      "Bug: x2, Ghost: x2, Dark: x2, Fighting: 1/2, Psychic: 1/2, "
    elsif (combined_type == "Bug")
      "Fire: x2, Flying: x2, Rock: x2, Grass: 1/2, Fighting: 1/2, Ground: 1/2"
    elsif (combined_type == "Rock")
      "Water: x2, Grass: x2, Fighting: x2, Ground: x2, Steel: x2, Normal: 1/2, Fire: 1/2, Poison: 1/2, Flying: 1/2"
    elsif (combined_type == "Ghost")
      "Ghost: x2, Dark: x2, Bug: 1/2, Poison: 1/2, Fighting: 0, Normal: 0"
    elsif (combined_type == "Dragon")
      "Ice: x2, Dragon: x2, Fairy: x2, Fire: 1/2, Water: 1/2, Electric: 1/2, Grass: 1/2"
    elsif (combined_type == "Dark")
      "Fighting: x2, Bug: x2, Fairy: x2, Ghost: 1/2, Dark: 1/2, Psychic: 0"
    elsif (combined_type == "Steel")
      "Fire: x2, Fighting: x2, Ground: x2, Normal: 1/2, Grass: 1/2, Ice: 1/2, Flying: 1/2, Psychic: 1/2, Bug: 1/2, Rock: 1/2, Dragon: 1/2, Steel: 1/2, Fairy: 1/2, Poison: 0"
    elsif (combined_type == "Fairy")
      "Poison: x2, Steel: x2, Fighting: 1/2, Bug: 1/2, Dark: 1/2, Dragon: 0"
    else
      "Huh, what kind of Pokemon is that?"
    end
  end


end
