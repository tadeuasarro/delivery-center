class RemovePaymentIdFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :paymentId, :integer
  end
end
