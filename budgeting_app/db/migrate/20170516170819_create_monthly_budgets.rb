class CreateMonthlyBudgets < ActiveRecord::Migration[5.0]
  def change
    create_table :monthlyBudgets do |t|
      t.string :month
      t.integer :year
      t.integer :amount
      t.references :user, foreign_key: true
      t.references :subcategory, foreign_key: true

      t.timestamps
    end
  end
end
