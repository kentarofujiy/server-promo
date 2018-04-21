class ProjetoArtifact < ActiveRecord::Base
    belongs_to :projeto
    belongs_to :artifact
end