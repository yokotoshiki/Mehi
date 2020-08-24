class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.integer :user_id
      t.integer :recipe
      t.string :name
      t.text :ingredient
      t.text :seasoning
      t.text :explanation
      t.integer :time
      t.integer :quanitiy
      t.date :plan
      t.integer :price

      t.timestamps
    end
  end
end
