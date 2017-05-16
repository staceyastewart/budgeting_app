class RemoveColumnFromSubcategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :subcategories, :categories_id
  end
end
