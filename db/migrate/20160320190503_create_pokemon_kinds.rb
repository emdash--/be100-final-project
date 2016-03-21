class CreatePokemonKinds < ActiveRecord::Migration
  def change
    create_table :pokemon_kinds do |t|
      t.integer :pokemon_id
      t.integer :kind_id

      t.timestamps null: false
    end
  end
end
