class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :externalCode
      t.integer :storeId
      t.string :subTotal
      t.string :deliveryFee
      t.float :total_shipping
      t.string :total
      t.string :countrystate
      t.string :city
      t.string :district
      t.string :street
      t.string :complement
      t.float :latitude
      t.float :longitute
      t.string :dtOrderCreated
      t.string :postalCode
      t.string :number
      t.integer :customerId
      t.integer :paymentId

      t.timestamps
    end
  end
end
