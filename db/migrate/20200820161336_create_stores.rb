class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.integer :store_category_id
      t.string :name
      t.text :explanation
      t.string :area
      t.text :address
      t.string :url

      t.timestamps
    end
  end
end
