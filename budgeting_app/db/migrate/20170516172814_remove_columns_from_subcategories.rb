class RemoveColumnsFromSubcategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :subcategories,  :amount
    remove_column :subcategories,  :category
    remove_column :subcategories,  :month
    remove_column :subcategories,  :year
    remove_column :subcategories, :month_num
  end
end
