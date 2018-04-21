class AddPoisToBusinesses < ActiveRecord::Migration[5.1]
  def change
    add_reference :businesses, :pois, foreign_key: true
  end
end
