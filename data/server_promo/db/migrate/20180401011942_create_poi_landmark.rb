class CreatePoiLandmark < ActiveRecord::Migration[5.2]
  def change
    create_table :poi_landmarks do |t|
      t.integer :poi_id
      t.integer :landmark_id
    end
  end
end
