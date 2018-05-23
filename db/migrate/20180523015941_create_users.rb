class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :hungry
      t.integer :energy
      t.boolean :admin, default: false
      t.integer :uid

      t.timestamps
    end
  end
end
