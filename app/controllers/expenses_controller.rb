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
  end

  def create
    months_array = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    case params[:month]
      when "January"
        @month_id = 1
      when "February"
        @month_id = 2
      when "March"
        @month_id = 3
      when "April"
        @month_id = 4
      when "May"
        @month_id = 5
      when "June"
        @month_id = 6
      when "July"
        @month_id = 7
      when "August"
        @month_id = 8
      when "September"
        @month_id = 9
      when "October"
        @month_id = 10
      when "November"
        @month_id = 11
      when "December"
        @month_id = 12
      when "ALL"
    end

    if (params["month"] == "ALL")
      Expense.create(
        [
          { description: params[:description], amount: params[:amount], day: params[:expenses][:day], month: "January", month_num: 1, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expenses][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expenses][:day], month: "February", month_num: 2, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expenses][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expenses][:day], month: "March", month_num: 3, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expenses][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expenses][:day], month: "April", month_num: 4, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expenses][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expenses][:day], month: "May", month_num: 5, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expenses][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expenses][:day], month: "June", month_num: 6, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expenses][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expenses][:day], month: "July", month_num: 7, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expenses][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expenses][:day], month: "August", month_num: 8, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expenses][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expenses][:day], month: "September", month_num: 9, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expenses][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expenses][:day], month: "October", month_num: 10, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expenses][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expenses][:day], month: "November", month_num: 11, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expenses][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expenses][:day], month: "December", month_num: 12, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expenses][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expenses][:day], month: "ALL", month_num: 0, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expenses][:subcategory] },
        ])
      redirect_to :back
    else
      Expense.create(
        description: params[:description],
        amount: params[:amount],
        day: params[:expense][:day],
        month: params[:month],
        month_num: @month_id,
        year: params[:year],
        user_id: params[:user_id],
        subcategory_id: params[:expense][:subcategory] )
      redirect_to :back
    end
  end

  def update
    @expenseToEdit = expense_to_edit
    return unless @expenseToEdit.user_id === user_id
    if @expenseToEdit.month == "ALL"
      @allToUpdate = expenses_to_update(@expenseToEdit)
      @allToUpdate.update(expense_params)
      redirect_to :back
    else
      if params[:expense][:subcategory].blank?
        @expenseToEdit.update(expense_params)
        redirect_to :back
      else
        @expenseToEdit.update(expense_params)
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
    params.permit(:description, :amount, :day)
  end

  def find_expense(month, year, user)
    Expense.where(:month => month).where(:year => year).where(:user_id => user)
  end

  def expense_to_edit
    Expense.find_by_id(params[:id])
  end

  def expenses_to_update(expense)
    Expense.where(day: expense[:day]).where(description: expense[:description]).where(year: expense[:year]).where(:user_id => current_user.id)
  end

  def delete_all_month(record_to_delete)
    Expense.where(day: record_to_delete[:day]).where(description: record_to_delete[:description]).where(year: record_to_delete[:year]).where(:user_id => current_user.id)
  end

end
