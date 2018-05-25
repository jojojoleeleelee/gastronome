class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe_id
      t.references :ingredient_id

      t.timestamps
    end
  end
end
