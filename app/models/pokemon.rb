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
    elsif (combined_type == "WaterPsychic" || combined_type == "PsychicWater")
      "Fire: 1/2, Water: 1/2, Electric: x2, Grass: x2, Ice: 1/2, Fighting: 1/2, Psychic: 1/2, Bug: x2, Ghost: x2, Dark: x2, Steel: 1/2"
    elsif (combined_type == "WaterBug" || combined_type == "BugWater")
      "Water: 1/2, Electric: x2, Ice: 1/2, Fighting: 1/2, Ground: 1/2, Flying: x2, Rock: x2, Steel: 1/2"
    elsif (combined_type == "WaterRock" || combined_type == "RockWater")
      "Normal: 1/2, Fire: 1/4, Electric: x2, Grass: x4, Ice: 1/2, Fighting: x2, Poison: 1/2, Ground: x2, Flying: 1/2"
    elsif (combined_type == "WaterGhost" || combined_type == "GhostWater")
      "Normal: 0, Fire: 1/2, Water: 1/2, Electric: x2, Grass: x2, Ice: 1/2, Fighting: 0, Poison: 1/2, Bug: 1/2, Ghost: x2, Dark: x2, Steel: 1/2"
    elsif (combined_type == "WaterDragon" || combined_type == "DragonWater")
      "Fire: 1/4, Water: 1/4, Dragon: x2, Steel: 1/2 Fairy: x2"
    elsif (combined_type == "WaterDark" || combined_type == "DarkWater")
      "Fire: 1/2, Water: 1/2, Electric: x2, Grass: x2, Ice: 1/2, Fighting: x2, Psychic: 0, Bug: x2, Ghost: 1/2, Dark: 1/2, Steel: 1/2, Fairy: x2"
    elsif (combined_type == "WaterSteel" || combined_type == "SteelWater")
      "Normal: 1/2, Water: 1/2, Electric: x2, Ice: 1/4, Fighting: x2, Poison: 0, Ground: 2, Flying: 1/2, Psychic: 1/2, Bug: 1/2, Rock: 1/2, Dragon: 1/2, Steel: 1/4, Fairy: 1/2"
    elsif (combined_type == "WaterFairy" || combined_type == "FairyWater")
      "Fire: 1/2, Water: 1/2, Electric: x2, Grass: x2, Ice: 1/2, Fighting: 1/2, Poison: x2, Bug: 1/2, Dragon: 0, Dark: 1/2"
    elsif (combined_type == "ElectricGrass" || combined_type == "GrassElectric")
      "Fire: x2, Water: 1/2, Electric: 1/4, Grass: 1/2, Ice: x2, Poison: x2, Bug: x2, Steel: 1/2"
    elsif (combined_type == "ElectricIce" || combined_type == "IceElectric")
      "Fire: x2, Electric: 1/2, Ice: 1/2, Fighting: x2, Flying: 1/2, Rock: x2"
    elsif (combined_type == "ElectricGround" || combined_type == "GroundElectric")
      "Water: x2, Electric: 0, Grass: x2, Ice: x2, Poison: 1/2, Ground: x2, Flying: 1/2, Rock: 1/2, Steel: 1/2"
    elsif (combined_type == "ElectricBug" || combined_type == "BugElectric")
      "Fire: x2, Electric: 1/2, Grass: 1/2, Fighting: 1/2, Rock: x2, Steel: 1/2"
    elsif (combined_type == "ElectricGhost" || combined_type == "GhostElectric")
      "Normal: 0, Electric: 1/2, Fighting: 0, Poison: 1/2, Ground: x2, Flying: 1/2, Bug: 1/2, Ghost: x2, Dark: x2, Steel: 1/2"
    elsif (combined_type == "ElectricDragon" || combined_type == "DragonElectric")
      "Fire: 1/2, Water: 1/2, Electric: 1/4, Grass: 1/2, Ice: x2, Ghost: x2, Flying: 1/2, Dragon: x2, Steel: 1/2, Fairy: x2"
    elsif (combined_type == "ElectricSteel" || combined_type == "SteelElectric")
      "Normal: 1/2, Fire: x2, Electric: 1/2, Grass: 1/2, Ice: 1/2, Fighting: x2, Poison: 0, Ground: x4, Flying: 1/4, Psychic: 1/2, Bug: 1/2, Rock: 1/2, Dragon: 1/2, Steel: 1/4, Fairy: 1/2"
    elsif (combined_type == "ElectricFairy" || combined_type == "FairyElectric")
      "Electric: 1/2, Fighting: 1/2, Poison: x2, Ground: x2, Flying: 1/2, Bug: 1/2, Dragon: 0, Dark: 1/2"
    elsif (combined_type == "GrassIce" || combined_type == "IceGrass")
      "Fire: x4, Water: 1/2, Electric: 1/2, Grass: 1/2, Fighting: x2, Poison: x2, Ground: 1/2, Flying: x2, Bug: x2, Rock: x2, Steel: x2"
    elsif (combined_type == "GrassFighting" || combined_type == "FightingGrass")
      "Fire: x2, Water: 1/2, Electric: 1/2, Grass: 1/2, Ice: x2, Poison: x2, Ground: 1/2, Flying: x4, Psychic: x2, Rock: 1/2, Dark: 1/2, Fairy: x2"
    elsif (combined_type == "GrassPoison" || combined_type == "PoisonGrass")
      "Fire: x2, Water: 1/2, Electric: 1/2, Grass: 1/4, Ice: x2, Fighting: 1/2, Flying: x2, Poison: x2, Fairy: 1/2"
    elsif (combined_type == "GrassGround" || combined_type == "GroundGrass")
      "Fire: x2, Electric: 0, Ice: x4, Ground: 1/2, Flying: x2, Bug: x2, Rock: 1/2"
    elsif (combined_type == "GrassFlying" || combined_type == "FlyingGrass")
      "Fire: x2, Water: 1/2, Electric: 1/4, Ice: x4, Fighting: 1/2, Poison: x2, Ground: 0, Flying: x2, Rock: x2"
    elsif (combined_type == "GrassPsychic" || combined_type == "PsychicGrass")
      "Fire: x2, Water: 1/2, Electric: 1/2, Grass: 1/2, Ice: x2, Fighting: 1/2, Poison: x2, Ground: 1/2, Flying: x2, Psychic: 1/2, Bug: x4, Ghost: x2, Dark: x2"
    elsif (combined_type == "GrassBug" || combined_type == "BugGrass")
      "Fire: x4, Water: 1/2, Electric: 1/2, Grass: 1/4, Ice: x2, Fighting: 1/2, Poison: x2, Ground: 1/4, Flying: x4, Bug; x2, Rock: x2"
    elsif (combined_type == "GrassRock" || combined_type == "RockGrass")
      "Fire: 1/2, Electric: 1/2, Ice: x2, Fighting: x2,Bug: x2, Steel: x2"
    elsif (combined_type == "GrassGhost" || combined_type == "GhostGrass")
      "Normal: 0, Fire: x2, Water: 1/2, Electric: 1/2, Grass: 1/2, Ice: x2, Fighting: 0, Ground: 1/2, Flying: x2, Ghost: x2, Dark: x2"
    elsif (combined_type == "GrassDragon" || combined_type "DragonGrass")
      "Water: 1/4, Electric: 1/4, Grass: 1/4, Ice: x2, Poison: x2, Ground: 1/2, Flying: x2, Bug: x2, Dark: x2, Fairy: x2"
    elsif (combined_type == "GrassDark" || combined_type == "DarkGrass")
      "Fire: x2,Water: 1/2, Electric: 1/2, Grass: 1/2, Ice: x2, Fighting: x2, Poison: x2, Ground: 1/2, Flying: x2, Psychic: 0, Bug: x4, Ghost: 1/2, Dark: 1/2, Fairy: x2"
    elsif (combined_type == "GrassSteel" || combined_type == "SteelGrass")
      "Normal: 1/2, Fire: x4, Water: 1/2, Electric: 1/2, Ice: 1/4, Fighting: x2, Poison: 0, Psychi: 1/2, Rock: 1/2, Dragon: 1/2, Steel: 1/2, Fairy: 1/2"
    elsif (combined_type == "GrassFairy" || combined_type == "FairyGrass")
      "Fire: x2, Water: 1/2, Electric: 1/2, Grass: 1/2, Ice: x2, Fighting: 1/2, Poison: x4, Ground: 1/2, Flying: x2, Dragon: 0, Dark: 1/2, Steel: x2"
    elsif (combined_type == "IceGround" || combined_type == "GroundIce")
      "Fire: x2, Water: x2, Electric: 0, Grass: x2, Fighting: x2, Poison: 1/2, Steel: x2"
    elsif (combined_type == "IceFlying" || combined_type == "FlyingIce")
      "Fire: x2, Electric: x2, Grass: 1/4, Ground: 0, Bug: 1/2, Rock: x4, Steel: x2"
    elsif (combined_type == "IcePsychic" || combined_type == "PsychicIce")
      "Fire: x2, Ice: 1/2, Psychic: 1/2, Bug: x2, Rock: x2, Ghost: x2, Dark: x2, Steel: x2"
    elsif (combined_type == "IceRock" || combined_type == "RockIce")
      "Normal: 1/2, Water: x2, Grass: x2, Ice: 1/2, Fighting: x4, Poison: 1/2, Ground: x2, Flying: 1/2, Rock: x2, Steel: x4"
    elsif (combined_type == "IceGhost" || combined_type == "GhostIce")
      "Normal: 0, Fire: x2, Ice: 1/2, Fighting: 0, Poison: 1/2, Bug: 1/2, Rock: x2, Ghost: x2, Dark: x2, Steel: x2"
    elsif (combined_type == "IceDragon" || combined_type == "DragonIce")
      "Water: 1/2, Electric: 1/2, Grass: 1/2, Fighting: x2, Rock: x2, Dragon: x2, Steel: x2, Fairy: x2"
    elsif (combined_type == "IceDark" || combined_type == "DarkIce")
      "Fire: x2, Ice: 1/2, Fighting: x4, Psychic: 0, Bug: x2, Rock: x2, Ghost: 1/2, Dark: 1/2, Steel: x2, Fairy: x2"
    elsif (combined_type == "FightingPoison" || combined_type == "PoisonFighting")
      "Grass: 1/2, Fighting: 1/2, Poison: 1/2, Ground: x2, Flying: x2, Psychic: x4, Bug: 1/4, Rock: 1/2, Dark: 1/2"
    elsif (combined_type == "FightingFlying" || combined_type == "FlyingFighting")
      "Electric: x2, Grass: 1/2, Ice: x2, Fighting: 1/2, Ground: 0, Flying: x2, Psychic: x2, Bug: 1/4, Dark: 1/2, Fairy: x2"
    elsif (combined_type == "FightingPsychic" || combined_type == "PsychicFighting")
      "Fighting: 1/2, Flying: x2, Rock: 1/2, Ghost: x2, Fairy: x2"
    elsif (combined_type == "FightingBug" || combined_type == "BugFighting")
      "Fire: x2, Grass: 1/2, Fighting: 1/2, Ground: 1/2, Flying: x4, Psychic: x2, Bug: 1/2, Dark: 1/2, Fairy: x2"
    elsif (combined_type == "FightingRock" || combined_type == "RockFighting")
      "Normal: 1/2, Fire: 1/2, Water: x2, Grass: x2, Fighting: x2, Poison: 1/2, Ground: x2, Psychic: x2, Bug: 1/2, Rock: 1/2, Dark: 1/2, Steel: x2, Fairy: x2"
    elsif (combined_type == "FightingDark" || combined_type == "DarkFighting")
      "Fighting: x2, Flying: x2, Psychic: 0, Rock: 1/2, Ghost: 1/2, Dark: 1/4, Fairy: x4"
    elsif (combined_type == "FightingSteel" || combined_type == "SteelFighting")
      "Normal: 1/2, Fire: x2, Grass: 1/2, Ice: 1/2, Fighting: 2, Poison: 0, Ground: x2, Bug: 1/4, Rock: 1/4, Dragon: 1/2, Dark: 1/2, Steel: 1/2"
    elsif (combined_type == "PoisonGround" || combined_type == "GroundPoison")
      "Water: x2, Electric: 0, Ice: x2, Fighting: 1/2, Poison: 1/4, Ground: x2, Psychic: x2, Bug: 1/2, Rock: 1/2, Fairy: 1/2"
    elsif (combined_type == "PoisonFlying" || combined_type == "FlyingPoison")
      "Electric: x2, Grass: 1/4, Ice: x2, Fighting: 1/4, Poison: 1/2, Ground: 0, Psychic: x2, Bug: 1/4, Rock: x2, Fairy: 1/2"
    elsif (combined_type == "PoisonBug" || combined_type == "BugPoison")
      "Fire: x2, Grass: 1/4, Fighting: 1/4, Poison: 1/2, Flying: x2, Psychic: x2, Bug: 1/2, Rock: x2, Fairy: 1/2"
    elsif (combined_type == "PoisonGhost" || combined_type == "GhostPoison")
      "Normal: 0, Grass: 1/2, Fighting: 0, Poison: 1/4, Ground: x2, Psychic: x2, Bug: 1/4, Ghost: x2, Dark: x2, Fairy: 1/2"
    elsif (combined_type == "PoisonDragon" || combined_type == "DragonPoison")
      "Fire: 1/2, Water: 1/2, Electric: 1/2, Grass: 1/4, Ice: x2, Fighting: 1/2, Poison: 1/2, Ground: x2, Psychic: x2, Bug: 1/2, Dragon: x2"
    elsif (combined_type == "PoisonDark" || combined_type == "DarkPoison")
      "Grass: 1/2, Poison: 1/2, Ground: x2, Psychic: 0, Ghost: 1/2, Dark: 1/2"
    elsif (combined_type == "GroundFlying" || combined_type == "FlyingGround")
      "Water: x2, Electric: 0, Ice: x4, Fighting: 1/2, Poison: 1/2, Ground: 0, Bug: 1/2"
    elsif (combined_type == "GroundPsychic" || combined_type == "PsychicGround")
      "Water: x2, Electric: 0, Grass: x2, Ice: x2, Fighting: 1/2, Poison: 1/2, Psychic: 1/2, Bug: x2, Rock: 1/2, Ghost: x2, Dark: x2"
    elsif (combined_type == "GroundBug" || combined_type == "BugGround")
      "Fire: x2, Water: x2, Electric: 0, Ice: x2, Fighting: 1/2, Poison: 1/2, Ground: 1/2, Flying: x2"
    elsif (combined_type == "GroundRock" || combined_type == "RockGround")
      "Normal: 1/2, Fire: 1/2, Water: x4, Electric: 0, Grass: x4, Ice: x2, Fighting: x2, Poison: 1/4, Ground: x2, Flying: 1/2, Rock: 1/2, Steel: x2"
    elsif (combined_type == "GroundGhost" || combined_type == "GhostGround")
      "Normal: 0, Water: x2, Electric: 0, Grass: x2, Ice: x2, Fighting: 0, Poison: 1/4, Bug: 1/2, Rock: 1/2, Ghost: x2, Dark: x2"
    elsif (combined_type == "GroundDragon" || combined_type == "DragonGround")
      "Fire: 1/2, Electric: 0, Ice: x4, Poison: 1/2, Rock: 1/2, Dragon: x2, Fairy: x2"
    elsif (combined_type == "GroundDark" || combined_type == "DarkGround")
      "Water: x2, Electric: 0, Grass: x2, Ice: x2, Fighting: x2, Poison: 1/2, Psychic: 0, Bug: x2, Rock: 1/2, Ghost: 1/2, Dark: 1/2, Fairy: x2"
    elsif (combined_type == "GroundSteel" || combined_type == "SteelGround")
      "Normal: 1/2, Fire: x2, Water: x2, Electric: 0, Fighting: x2, Poison: 0, Ground x2, Flying: 1/2, Psychic: 1/2, Bug: 1/2, Rock: 1/4, Dragon: 1/2, Steel: 1/2, Fairy: 1/2"
    elsif (combined_type == "FlyingPsychic" || combined_type == "PsychicFlying")
      "Electric: x2, Grass: 1/2, Ice: x2, Fighting: 1/4, Ground: 0, Psychic: 1/2, Rock: x2, Ghost: x2, Dark: x2"
    elsif (combined_type == "FlyingRock" || combined_type == "RockFlying")
      "Normal: 1/2, Fire: 1/2, Water: x2, Electric: x2, Ice: x2, Poison: 1/2, Ground: 0, Flying: 1/2, Bug: 1/2, Rock: x2, Steel: x2"
    elsif (combined_type == "FlyingGhost" || combined_type == "GhostFlying")
      "Normal: 0, Electric: x2, Grass: 1/2, Ice: x2, Fighting: 0, Poison: 1/2, Ground: 0, Bug: 1/4, Rock: x2, Ground: x2, Dark: x2"
    elsif (combined_type == "FlyingDragon" || combined_type == "DragonFlying")
      "Fire: 1/2, Water: 1/2, Grass: 1/4, Ice: x4, Fighting: 1/2, Ground: 0, Bug: 1/2, Rock: x2, Dragon: x2, Fairy: x2"
    elsif (combined_type == "FlyingDark" || combined_type == "DarkFlying")
      "Electric: x2, Grass: 1/2, Ice: x2, Ground: 0, Psychic: 0, Rock: 2, Ghost: 1/2, Dark: 1/2, Fairy: x2"
    elsif (combined_type == "FlyingSteel" || combined_type == "SteelFlying")
      "Normal: 1/2, Fire: x2, Electric: x2, Grass: 1/4, Poison: 0, Ground: 0, Flying: 1/2, Psychic: 1/2, Bug: 1/4, Dragon: 1/2, Steel: 1/2, Fairy: 1/2"
    elsif (combined_type == "FlyingFairy" || combined_type == "FairyFlying")
      "Electric: x2, Grass: 1/2, Ice: x2, Fighting: 1/4, Poison: x2, Ground: 0, Bug: 1/4, Rock: x2, Dragon: 0, Dark: 1/2, Steel: x2"
    elsif (combined_type == "PsychicRock" || combined_type == "RockPsychic")
      "Normal: 1/2, Fire: 1/2, Water: x2, Grass: x2, Poison: 1/2, Ground: x2, Flying: 1/2, Psychic: 1/2, Bug: x2, Ghost: x2, Dark: x2, Steel: x2"
    elsif (combined_type == "PsychicGhost" || combined_type == "GhostPsychic")
      "Normal: 0, Fighting: 0, Poison: 1/2, Psychic: 1/2, Ghost: x4, Dark: x4"
    elsif (combined_type == "PsychicDragon" || combined_type == "DragonPsychic")
      "Fire: 1/2, Water: 1/2, Electric: 1/2, Grass: 1/2, Ice: x2, Fighting: 1/2, Psychic: 1/2, Bug: x2, Ghost: x2, Dragon: x2, Dark: x2, Fairy: x2"
    elsif (combined_type == "PsychicDark" || combined_type == "DarkPsychic")
      "Psychic: 0, Bug: x4, Fairy: x2"
    elsif (combined_type == "PsychicSteel" || combined_type == "SteelPsychic")
      "Normal: 1/2, Fire: x2, Grass: 1/2, Ice: 1/2, Poison: 0, Ground: x2, Flying: 1/2, Psychic: 1/4, Rock: 1/2, Ghost: x2, Dragon: 1/2, Dark: x2, Steel: 1/2, Fairy: 1/2"
    elsif (combined_type == "PsychicFairy" || combined_type == "FairyPsychic")
      "Fighting: 1/4, Poison: x2, Psychic: 1/2, Ghost: x2, Dragon: 0, Steel: x2"
    elsif (combined_type == "BugRock" || combined_type == "RockBug")
      "Normal: 1/2, Water: x2, Poison: 1/2, Rock: x2, Steel: x2"
    elsif (combined_type == "BugGhost" || combined_type == "GhostBug")
      "Normal: 0, Fire: x2, Grass: 1/2, Fighting: 0, Poison: 1/2, Ground: 1/2, Flying: x2, Bug: 1/2, Rock: x2, Ghost: x2, Dark: x2"
    elsif (combined_type == "BugSteel" || combined_type == "SteelBug")
      "Normal: 1/2, Fire: x4, Grass: 1/4, Ice: 1/2, Poison: 0, Psychic: 1/2, Bug: 1/2, Dragon: 1/2, Steel: 1/2, Fairy: 1/2"
    elsif (combined_type == "RockDragon" || combined_type == "DragonRock")
      "Normal: 1/2, Fire: 1/4, Electric: 1/2, Ice: x2, Fighting: x2, Poison: 1/2, Ground: x2, Flying: 1/2, Dragon: x2, Steel: x2, Fairy: x2"
    elsif (combined_type == "RockDark" || combined_type == "DarkRock")
      "Normal: 1/2, Fire: 1/2, Water: x2, Grass: x2, Fighting: x4, Poison: 1/2, Ground: x2, Flying: 1/2, Psychic: 0, Bug: x2, Ghost: 1/2, Dark: 1/2, Steel: x2, Fairy: x2"
    elsif (combined_type == "RockSteel" || combined_type == "SteelRock")
      "Normal: 1/4, Water: x2, Ice: 1/2, Fighting: x4, Poison: 0, Ground: x4, Flying: 1/4, Psychic: 1/2, Bug: 1/2, Rock: 1/2, Dragon: 1/2, Fairy: 1/2"
    elsif (combined_type == "GhostDragon" || combined_type == "DragonGhost")
      "Normal: 0, Fire: 1/2, Water: 1/2, Electric: 1/2, Grass: 1/2, Ice: x2, Fighting: 0, Poison: 1/2, Bug: 1/2, Ghost: x2, Dragon: x2, Dark: x2, Fairy: x2"
    elsif (combined_type == "GhostDark" || combined_type == "DarkGhost")
      "Normal: 0, Fighting: 0, Poison: 1/2, Psychic: 0, Fairy: x2"
    elsif (combined_type == "GhostSteel" || combined_type == "SteelGhost")
      "Normal: 0, Fire: x2, Grass: 1/2, Ice: 1/2, Fighting: 0, Poison: 0, Ground: x2, Flying: 1/2, Psychic: 1/2, Bug: 1/4, Rock: 1/2, Ghost: x2, Dragon: 1/2, Dark: x2, Steel: 1/2, Fairy: 1/2"
    elsif (combined_type == "DragonDark" || combined_type == "DarkDragon")
      "Fire: 1/2, Water: 1/2, Electric: 1/2, Grass: 1/2, Ice: x2, Fighting: x2, Psychic: 0, Bug: x2, Ghost: 1/2, Dragon: x2, Dark: 1/2, Fairy: x4"
    elsif (combined_type == "DragonSteel" || combined_type == "SteelDragon")
      "Normal: 1/2, Water: 1/2, Electric: 1/2, Grass: 1/4, Fighting: x2, Poison: 0, Ground: x2, Flying: 1/2, Psychic: 1/2, Bug: 1/2, Rock: 1/2, Steel: 1/2"
    elsif (combined_type == "DragonFairy" || combined_type == "FairyDragon")
      "Fire: 1/2, Water: 1/2, Electric: 1/2, Grass: 1/2, Ice: x2, Fighting: 1/2, Poison: x2, Bug: 1/2, Dragon: 0, Dark: 1/2, Steel: x2, Fairy: x2"
    elsif (combined_type == "DarkSteel" || combined_type == "SteelDark")
      "Normal: 1/2, Fire: x2, Grass: 1/2, Ice: 1/2, Fighting: 4, Poison: 0, Ground: x2, Flying: 1/2, Psychic: 0, Rock: 1/2, Ghost: 1/2, Dragon: 1/2, Dark: 1/2, Steel: 1/2"
    elsif (combined_type == "SteelFairy" || combined_type == "FairySteel")
      "Normal: 1/2, Fire: x2, Grass: 1/2, Ice: 1/2, Poison: 0, Ground: x2, Flying: 1/2, Psychic: 1/2, Bug: 1/4, Rock: 1/2, Dragon: 0, Dark: 1/2, Fairy: 1/2"












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
