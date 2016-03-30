class PokemonKindsChangeKind1IdtoKind < ActiveRecord::Migration
  def change
    rename_column(:pokemon_kinds, :kind1_id, :kind_id)
  end
end
