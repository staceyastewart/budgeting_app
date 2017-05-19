class AddMonthIdtoIncome < ActiveRecord::Migration[5.0]
  def change
    add_column :incomes, :month_num, :integer
  end
end
