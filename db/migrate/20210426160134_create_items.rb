class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :externalCode
      t.string :name
      t.float :price
      t.integer :quantity
      t.float :total
      t.array :subItems

      t.timestamps
    end
  end
end
