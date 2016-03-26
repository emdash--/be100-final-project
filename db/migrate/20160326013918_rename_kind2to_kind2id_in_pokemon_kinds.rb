class RenameKind2toKind2idInPokemonKinds < ActiveRecord::Migration
  def change
    rename_column(:pokemon_kinds, :kind2, :kind2_id)
  end
end
