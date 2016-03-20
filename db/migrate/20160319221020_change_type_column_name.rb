class ChangeTypeColumnName < ActiveRecord::Migration
  def change
    rename_column(:pokemons, :poke_type, :poke_type1)
  end
end
