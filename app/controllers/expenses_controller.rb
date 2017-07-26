class ExpensesController < ApplicationController

  def index
    @user = user_id
    @user_hash = set_user
    @year = find_year
    @expense = find_expense("ALL", @year, set_user)
    @date = Date.today
    @month = @date.strftime("%B")
  end

  def show
    @user = user_id
    @month =  find_month
    @monthExpense = find_expense(@month, find_year, set_user)
    @subcategories = subcategories_arr
  end

  def create
    months_array = ["ALL", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    if (params["month"] == "ALL")
      months_array.each do |month|
        new_month = month
        Expense.create(description: params[:description], amount: params[:amount], day: params[:expenses][:day], month: new_month, month_num: months_array.index(new_month), year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expenses][:subcategory])
      end
      redirect_to :back
    else
      Expense.create(
        description: params[:description],
        amount: params[:amount],
        day: params[:expense][:day],
        month: params[:month],
        month_num: months_array.index(params[:month]),
        year: params[:year],
        user_id: params[:user_id],
        subcategory_id: params[:expense][:subcategory] )
      redirect_to :back
    end
  end

  def update
    expenseToEdit = expense_to_edit
    return unless expenseToEdit.user_id === user_id
    if expenseToEdit.month == "ALL"
      allToUpdate = expenses_to_update(expenseToEdit)
      allToUpdate.update(expense_params)
      redirect_to :back
    else
      puts params
      if params[:expense][:subcategory].blank?
        expenseToEdit.update(expense_params)
        redirect_to :back
      else
        expenseToEdit.update(
          description: params[:description],
          amount: params[:amount],
          subcategory: Subcategory.find_by_id(params[:expense][:subcategory]),
          day: params[:day])
        # need to figure out how to refactor to update subcategory using strong params, below does not work
        # expenseToEdit.update(expense_params)
        redirect_to :back
      end
    end
  end

  def destroy
    toDelete = expense_to_edit
    return unless toDelete.user_id === current_user.id
    if toDelete.month == "ALL"
      allToDelete = delete_all_month(toDelete)
      allToDelete.destroy_all
      redirect_to :back
    else
      toDelete.destroy
      redirect_to :back
    end
  end

  private

  def set_user
    User.find_by_id(current_user.id)
  end

  def user_id
    current_user.id
  end

  def subcategories_arr
    Subcategory.where(:user_id => current_user.id)
  end

  def find_year
    params[:year]
  end

  def find_month
    if params[:month]
      return params[:month]
    else
      return params[:id]
    end
  end

  def expense_params
    params.permit(:description, :amount, :day, :subcategory)
  end

  def find_expense(month, year, user)
    Expense.where(:month => month).where(:year => year).where(:user_id => user)
  end

  def expense_to_edit
    Expense.find_by_id(params[:id])
  end

  def updated_subcategory
    Subcategory.find_by_id(params[:expense][:subcategory])
  end

  def expenses_to_update(expense)
    Expense.where(day: expense[:day]).where(description: expense[:description]).where(year: expense[:year]).where(:user_id => current_user.id)
  end

  def delete_all_month(record_to_delete)
    Expense.where(day: record_to_delete[:day]).where(description: record_to_delete[:description]).where(year: record_to_delete[:year]).where(:user_id => current_user.id)
  end

end
