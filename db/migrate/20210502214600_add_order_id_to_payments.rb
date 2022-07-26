class AddOrderIdToPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :orderId, :integer
  end
end
