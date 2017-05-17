class ExpensesController < ApplicationController

  def index
    @user = current_user.id
    puts @user
    puts "wtf"
    @expense = Expense.where(:month => "ALL").where(:year => params[:year]).where(:user_id => current_user.id)
  end

  def show
    @user = current_user.id
    month =  params[:id]
    @monthExpense = Expense.where(:month => month).where(:year => params[:year]).where(:user_id => current_user.id)
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

    puts params

    if (params["month"] == "ALL")
      Expense.create(
        [
          { description: params[:description], amount: params[:amount], day: params[:expense][:day], month: "January", month_num: 1, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expense][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expense][:day], month: "February", month_num: 2, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expense][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expense][:day], month: "March", month_num: 3, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expense][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expense][:day], month: "April", month_num: 4, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expense][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expense][:day], month: "May", month_num: 5, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expense][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expense][:day], month: "June", month_num: 6, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expense][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expense][:day], month: "July", month_num: 7, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expense][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expense][:day], month: "August", month_num: 8, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expense][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expense][:day], month: "September", month_num: 9, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expense][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expense][:day], month: "October", month_num: 10, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expense][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expense][:day], month: "November", month_num: 11, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expense][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expense][:day], month: "December", month_num: 12, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expense][:subcategory] },
          { description: params[:description], amount: params[:amount], day: params[:expense][:day], month: "ALL", month_num: 0, year: params[:year], user_id: params[:user_id], isrecurring: true, subcategory_id: params[:expense][:subcategory] },
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
    return unless @expenseToEdit.user_id === current_user.id
    @expenseToEdit.update(
        description: params[:description],
        amount: params[:amount],
        day: params[:day],
        month: params[:month],
        month_num: @month_id,
        year: params[:year] )
      redirect_to :back
  end

  def destroy
    toDelete = Expense.where(:id => params[:id])
    return unless toDelete.first.user_id === current_user.id
    toDelete.destroy_all
    redirect_to :back
  end
end
