class CreatePokemons < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons do |t|
      t.integer :combat_points,  
      t.string :name,  
      t.string :image_url

      t.timestamps
    end
  end
end
