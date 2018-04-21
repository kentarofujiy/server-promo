class CreateTourPois < ActiveRecord::Migration[5.1]
  def change
    create_table :tour_pois do |t|
      t.integer :poi_id
      t.integer :tour_id
    end
  end
end
