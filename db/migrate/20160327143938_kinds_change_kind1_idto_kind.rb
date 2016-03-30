class KindsChangeKind1IdtoKind < ActiveRecord::Migration
  def change
    rename_column(:kinds, :kind1, :kind)
  end
end
