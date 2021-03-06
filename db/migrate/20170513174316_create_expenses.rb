class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :month
      t.string :day
      t.string :year
      t.float :amount
      t.string :description
      t.boolean :isrecurring
      t.references :subcategory, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
