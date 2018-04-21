class CreateProjetoArtifacts < ActiveRecord::Migration[5.1]
  def change
    create_table :projeto_artifacts do |t|
      t.integer :projeto_id
      t.integer :artifact_id
    end
  end
end
