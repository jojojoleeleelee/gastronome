class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :user_id
      t.integer :time
      t.text :instruction

      t.timestamps
    end
  end
end
