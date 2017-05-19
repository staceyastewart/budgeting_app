class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :subcategories
  has_many :categories
  has_many :expenses
  has_many :incomes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def total_month_budget(month, year)
    user = self.id
    month_budget_arr = []
    categories.each do |category|
      month_budget_arr.push(category.month_budget_by_category(month, year, user))
    end
    return month_budget_arr.reduce(:+)
  end

  def total_month_expense(month, year)
    user = self.id
    month_exp_arr = []
    categories.each do |category|
      month_exp_arr.push(category.month_expense_by_category(month, year, user))
    end
    return month_exp_arr.reduce(:+)
  end

  def total_month_budget_by_category(month, year)
    user = self.id
    month_budget_arr = []
    categories.each do |category|
      month_budget_arr.push([category.title, category.month_budget_by_category(month, year, user)])
    end
    return month_budget_arr
  end

  def total_month_expense_by_category(month, year)
    user = self.id
    month_budget_arr = []
    categories.each do |category|
      month_budget_arr.push([category.title, category.month_expense_by_category(month, year, user)])
    end
    return month_budget_arr
  end
end
