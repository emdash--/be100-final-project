class AddKinds2toPokemonKinds < ActiveRecord::Migration
  def change
    add_column(:pokemon_kinds, :kind2, :string)

  end
end
