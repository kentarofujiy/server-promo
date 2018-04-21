class Projeto < ActiveRecord::Base
    belongs_to :user
    has_many :projeto_categories
    has_many :categories, through: :projeto_categories
    has_many :projeto_artifacts
    has_many :artifacts, through: :projeto_artifacts
    before_save { self.email = email.downcase }
    validates :nome, presence: true
    validates :especialidade, presence: true
    validates :telefone, presence: true
    validates :endereco, presence: true
    validates :email, presence: true
    validates :user_id, presence: true
end