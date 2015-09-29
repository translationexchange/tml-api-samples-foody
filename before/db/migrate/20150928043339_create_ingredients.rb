class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :recipe_id
      t.string  :quantity
      t.string  :name
      t.string  :measurements
      t.integer :index

      t.timestamps null: false
    end

    add_index :ingredients, :recipe_id
  end
end
