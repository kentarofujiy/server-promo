class ProjetoCategory < ActiveRecord::Base
    belongs_to :projeto
    belongs_to :category
end