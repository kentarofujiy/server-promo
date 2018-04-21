class RemoveAvatarFromNews < ActiveRecord::Migration[5.2]
  def change
    remove_column :news, :avatar
  end
end
