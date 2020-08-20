class AddImageIdToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :image_id, :string
  end
end
