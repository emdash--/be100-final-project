class RenameKindIDtoKind1id < ActiveRecord::Migration
  def change
    rename_column(:pokemon_kinds, :kind_id, :kind1_id)
  end
end
