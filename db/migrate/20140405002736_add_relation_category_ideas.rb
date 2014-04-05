class AddRelationCategoryIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :category_id, :integer, null: true
    add_index :ideas, :category_id
  end
end
