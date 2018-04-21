class CreateProjetoCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :projeto_categories do |t|
      t.integer :projeto_id
      t.integer :category_id
    end
  end
end
