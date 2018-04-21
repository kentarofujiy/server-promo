class AddEmailToProjetos < ActiveRecord::Migration[5.1]
  def change
    add_column :projetos, :email, :string
    add_column :projetos, :created_at, :datetime
    add_column :projetos, :updated_at, :datetime
  end
end
