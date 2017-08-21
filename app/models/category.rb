class Category < ApplicationRecord
  has_many :subcategories, dependent: :destroy

  #below method will return the total budget for one category for one month in one year
  def month_budget_by_category(month, year, user)
    total_budget_arr = []
    subcategories.each do |x|
        total_budget_arr.push(x.total_budget(month, year, user))
    end
    total_budget_arr.map! { |x| x ? x : 0}
    return total_budget_arr.reduce(:+)
  end

  #below method will return the total expenses for one category for one month in one year
  def month_expense_by_category(month, year, user, chart)
    total_expense_arr = []
    subcategories.each do |subcategory|
        total_expense_arr.push(subcategory.total_expense(month, year, user, chart))
    end
    total_expense_arr.map! { |x| x ? x : 0}
    if total_expense_arr.reduce(:+) < 0
      return 1
    else
      return total_expense_arr.reduce(:+)
    end
  end


end
