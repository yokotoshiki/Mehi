class CreateSeasonings < ActiveRecord::Migration[5.2]
  def change
    create_table :seasonings do |t|
      t.references :recipe, foreign_key: true
      t.string :name
      t.string :quanitiy

      t.timestamps
    end
  end
end
