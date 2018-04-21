class CreateLandmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :landmarks do |t|
      t.string :title
      t.text :description
      t.text :details
      t.text :avatar

      t.timestamps
    end
  end
end
