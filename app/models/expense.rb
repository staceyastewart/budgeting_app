class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :subcategory

  def update_expense(expense_params, expenseToEdit, user)
    if expenseToEdit.month == "ALL"
      allToUpdate = expenses_to_update(expenseToEdit, user)
      allToUpdate.update(expense_params)
    else
      expenseToEdit.update(expense_params)
    end
  end

  def expenses_to_update(expense, user)
    Expense.where(day: expense[:day]).where(description: expense[:description]).where(year: expense[:year]).where(:user_id => user)
  end



end
