class AddAcessibilidadeToPoi < ActiveRecord::Migration[5.1]
  def change
    add_column :pois, :acessibilidade, :string
  end
end
