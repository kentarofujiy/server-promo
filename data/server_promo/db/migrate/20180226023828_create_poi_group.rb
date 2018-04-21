class CreatePoiGroup < ActiveRecord::Migration[5.1]
  def change
    create_table :poi_groups do |t|
      t.integer :poi_id
      t.integer :group_id
    end
  end
end
