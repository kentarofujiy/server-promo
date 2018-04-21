class CreateProjetos < ActiveRecord::Migration[5.1]
  def change
    create_table :projetos do |t|
      t.string :nome
      t.string :especialidade
      t.string :telefone
      t.string :endereco
    end
  end
end
