class AddType2Column < ActiveRecord::Migration
  def change
    add_column(:pokemons, :poke_type2, :string)
  end
end
