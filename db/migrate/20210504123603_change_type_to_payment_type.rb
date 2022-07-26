class ChangeTypeToPaymentType < ActiveRecord::Migration[6.1]
  def change
    rename_column :payments, :type, :paymentType
  end
end
