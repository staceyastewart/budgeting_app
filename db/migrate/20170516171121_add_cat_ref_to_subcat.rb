class AddCatRefToSubcat < ActiveRecord::Migration[5.0]
  def change
    add_reference :subcategories, :categories, index: true, foreign_key: true

  end
end
