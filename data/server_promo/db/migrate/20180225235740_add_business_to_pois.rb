class AddBusinessToPois < ActiveRecord::Migration[5.1]
  def change
    add_reference :pois, :business, foreign_key: true
  end
end
