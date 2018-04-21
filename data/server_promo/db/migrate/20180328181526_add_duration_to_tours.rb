class AddDurationToTours < ActiveRecord::Migration[5.2]
  def change
    add_column :tours, :duration, :string
    add_column :tours, :intensity, :string
    add_column :tours, :distance, :string
    add_column :tours, :audience, :string
    add_column :tours, :details, :text
  end
end
