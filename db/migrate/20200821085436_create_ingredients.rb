class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.integer :user_id
      t.integer :ingredient_category_id
      t.string :name
      t.string :quanitiy
      t.text :note
      t.date :expiration_date, null: false

      t.timestamps
    end
  end
end
