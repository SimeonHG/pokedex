class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :level
      t.string :primary_type
      t.string :secondary_type
      t.string :trainer_name
      t.float :hight
      t.float :weight
      t.string :gender
      t.string :region

      t.timestamps
    end
  end
end
