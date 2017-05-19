class AddMonthIdtoExpenses < ActiveRecord::Migration[5.0]
  def change
    add_column :expenses, :month_num, :integer
  end
end
