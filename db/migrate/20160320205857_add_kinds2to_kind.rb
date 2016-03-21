class AddKinds2toKind < ActiveRecord::Migration
  def change
    add_column(:kinds, :kind2_id, :string)
  end
end
