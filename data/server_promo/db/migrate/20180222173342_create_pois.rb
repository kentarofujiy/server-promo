class CreatePois < ActiveRecord::Migration[5.1]
  def change
    create_table :pois do |t|
      t.boolean :active, default: true
      t.string :name
      t.string :string
      t.string :address
      t.text :notes
      t.text :description
      t.timestamps null: false
    end
  end
end
