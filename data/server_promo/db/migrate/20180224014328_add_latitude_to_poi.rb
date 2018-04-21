class AddLatitudeToPoi < ActiveRecord::Migration[5.1]
  def change
    add_column :pois, :latitude, :float
    add_column :pois, :longitude, :float
  end
end
