class RemoveCountryStateFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :countrystate, :string
  end
end
