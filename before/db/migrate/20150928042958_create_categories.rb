class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string  :key
      t.string  :name
      t.string  :locale
      t.integer :featured_index
      t.timestamps null: false
    end

    add_index :categories, :key
  end
end
