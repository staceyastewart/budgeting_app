class ExpensesController < ApplicationController

  def index
    @user = current_user.id
    @user_hash = set_user
    @year = find_year
    @expense = find_expense("ALL", @year, set_user)
    @date = Date.today
    @month = @date.strftime("%B")
  end

  def show
    @user = current_user.id
    @month =  find_month
    @monthExpense = find_expense(@month, find_year, set_user)
    @subcategories = subcategories_arr
  end

  def create
    months_array = ["ALL", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    if (params["month"] == "ALL")
      months_array.each do |month|
        Expense.create(
          description: params[:description],
          amount: params[:amount],
          day: params[:expenses][:day],
          month: month,
          month_num: months_array.index(month),
          year: params[:year],
          user_id: params[:user_id],
          isrecurring: true,
          subcategory_id: params[:expenses][:subcategory])
      end
      redirect_back(fallback_location: root_path)
    else
      Expense.create(
        description: params[:description],
        amount: params[:amount],
        day: params[:expense][:day],
        month: params[:month],
        month_num: months_array.index(params[:month]),
        year: params[:year],
        user_id: params[:user_id],
        subcategory_id: params[:expense][:subcategory])
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @expense = expense_to_edit
    if @expense.update_attributes(expense_params)
      flash[:notice] = "SUCCESS"
    else
      flash[:alert] = "DID NOT SAVE"
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    toDelete = expense_to_edit
    return unless toDelete.user_id === current_user.id
    if toDelete.month == "ALL"
      allToDelete = delete_all_month(toDelete)
      allToDelete.destroy_all
      redirect_back(fallback_location: root_path)
    else
      toDelete.destroy
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def set_user
    User.find_by_id(current_user.id)
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
    params.require(:expense).permit(:description, :amount, :day, :subcategory_id, :month, :year)
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

  def delete_all_month(record_to_delete)
    Expense.where(day: record_to_delete[:day]).where(description: record_to_delete[:description]).where(year: record_to_delete[:year]).where(:user_id => current_user.id)
  end

end
