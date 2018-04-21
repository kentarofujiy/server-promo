class RemoveAvatarFromPois < ActiveRecord::Migration[5.2]
  def change
    remove_column :pois, :avatar
  end
end
