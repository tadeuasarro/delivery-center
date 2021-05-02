class ChangeDtOrderCreatedToDateOrderCreate < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :dtOrderCreated, :dtOrderCreate
  end
end
