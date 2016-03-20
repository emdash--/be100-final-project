class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.integer :poke_number
      t.string :poke_name
      t.string :poke_type

      t.timestamps null: false
    end
  end
end
