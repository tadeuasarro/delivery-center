class CreateItemOrderRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :item_order_relations do |t|
      t.integer :order_id
      t.integer :item_id

      t.timestamps
    end
  end
end
