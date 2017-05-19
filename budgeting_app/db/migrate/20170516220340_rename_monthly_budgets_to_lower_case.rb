class RenameMonthlyBudgetsToLowerCase < ActiveRecord::Migration[5.0]
  def change
    rename_table :monthlyBudgets, :monthly_budgets
  end
end
