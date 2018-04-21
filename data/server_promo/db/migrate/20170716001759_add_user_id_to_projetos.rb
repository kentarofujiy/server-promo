class AddUserIdToProjetos < ActiveRecord::Migration[5.1]
  def change
      add_column :projetos, :user_id, :integer
  end
end
