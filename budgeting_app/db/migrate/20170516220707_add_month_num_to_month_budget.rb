class AddMonthNumToMonthBudget < ActiveRecord::Migration[5.0]
  def change
    add_column :monthly_budgets, :month_num, :integer
  end
end
