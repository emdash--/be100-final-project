class Pokemon < ActiveRecord::Base
  has_many :pokemon_kinds
  has_many :kinds, through: :pokemon_kinds
end
