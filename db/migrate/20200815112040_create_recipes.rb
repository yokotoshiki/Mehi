class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.integer :recipe_category_id
      t.string :name
      t.string :image_id
      t.text :ingredient
      t.text :seasoning
      t.text :explanation
      t.integer :time
      t.integer :quanitiy
      t.integer :price

      t.timestamps
    end
  end
end
