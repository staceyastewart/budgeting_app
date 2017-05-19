class AddReferenceToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :categories, :string
    add_reference :categories, :user, foreign_key: true
  end
end
