class RenameKindtoKind1inKindsModel < ActiveRecord::Migration
  def change
    rename_column(:kinds, :kind, :kind1)
  end
end
