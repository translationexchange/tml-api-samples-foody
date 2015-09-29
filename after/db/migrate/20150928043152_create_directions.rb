class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.integer :recipe_id
      t.text    :description
      t.integer :index

      t.timestamps null: false
    end

    add_index :directions, :recipe_id
  end
end
