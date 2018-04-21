class ProjetoSerializer < ActiveModel::Serializer

  attributes :nome, :especialidade, :telefone, :endereco, :email, :created_at, :updated_at, :user_id
end 

    