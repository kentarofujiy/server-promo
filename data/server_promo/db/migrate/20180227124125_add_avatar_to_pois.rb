class AddAvatarToPois < ActiveRecord::Migration[5.1]
  def change
    add_column :pois, :avatar, :string
  end
end
