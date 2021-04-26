class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.string :type
      t.float :value

      t.timestamps
    end
  end
end
