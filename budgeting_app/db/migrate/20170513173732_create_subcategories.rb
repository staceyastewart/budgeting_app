class CreateSubcategories < ActiveRecord::Migration[5.0]
  def change
    create_table :subcategories do |t|
      t.string :name
      t.float :amount
      t.string :category
      t.string :month
      t.string :year
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
