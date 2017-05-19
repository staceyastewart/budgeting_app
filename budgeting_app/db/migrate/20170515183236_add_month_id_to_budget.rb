class AddMonthIdToBudget < ActiveRecord::Migration[5.0]
  def change
    add_column :subcategories, :month_num, :integer
  end
end
