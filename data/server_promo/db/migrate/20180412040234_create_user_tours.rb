class CreateUserTours < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tours do |t|
      t.integer :user_id
      t.integer :tour_id
    end
  end
end
