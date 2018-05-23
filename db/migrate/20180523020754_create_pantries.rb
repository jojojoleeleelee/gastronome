class CreatePantries < ActiveRecord::Migration[5.2]
  def change
    create_table :pantries do |t|
      t.integer :recipe_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
