class ChangeLongituteToLongitude < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :longitute, :longitude
  end
end
