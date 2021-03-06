class ExpensesController < ApplicationController

  def index
    @user = current_user.id
    @expense = Expense.where(:month => "ALL").where(:year => params[:year]).where(:user_id => current_user.id)
    @year = params[:year]
    @date = Date.today
    @month = @date.strftime("%B")
  end

  def show
    @user = current_user.id
    @month =  params[:id]
    @monthExpense = Expense.where(:month => @month).where(:year => params[:year]).where(:user_id => current_user.id)
  end

  def create
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
    @expenseToEdit = Expense.find_by_id(params[:id])
    p @expenseToEdit.month.class
    return unless @expenseToEdit.user_id === current_user.id
    if @expenseToEdit.month == "ALL"
      puts "YES ALL OF THEM"
      @allToUpdate = Expense.where(day: @expenseToEdit[:day]).where(description: @expenseToEdit[:description]).where(year: @expenseToEdit[:year]).where(:user_id => current_user.id)
      p @allToUpdate
      @allToUpdate.update(
        description: params[:description],
        amount: params[:amount],
        day: params[:day])
      redirect_to :back
    else
      puts "NO NOT HITTING"
      @expenseToEdit.update(
        description: params[:description],
        amount: params[:amount],
        day: params[:day] )
      redirect_to :back
    end
  end

  def destroy
    toDelete = Expense.find_by_id(params[:id])
    return unless toDelete.user_id === current_user.id
    if toDelete.month == "ALL"
      allToDelete = Expense.where(day: toDelete[:day]).where(description: toDelete[:description]).where(year: toDelete[:year]).where(:user_id => current_user.id)
      allToDelete.destroy_all
      redirect_to :back
    else
      toDelete.destroy
      redirect_to :back
    end
  end
end
