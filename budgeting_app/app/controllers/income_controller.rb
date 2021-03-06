class IncomeController < ApplicationController
  # before_filter :authenticate_user!

  def index
    @user_id = current_user.id
    # @recurring = Income.where(:isrecurring => true)
    @recurring = Income.where(:isrecurring => true).where(:month => "ALL").where(:year => params[:year]).where(:user_id => current_user.id)
    @year = params[:year]
  end

  def show
    @user_id = current_user.id
    @month =  params[:id]
    @monthIncome = Income.where(:month => @month).where(:year => params[:year]).where(:user_id => current_user.id)
    puts @monthIncome
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
      Income.create(
        [
          { description: params[:description], amount: params[:amount], day: params[:day], month: "January", month_num: 1, year: params[:year], user_id: params[:user_id], isrecurring: true },
          { description: params[:description], amount: params[:amount], day: params[:day], month: "February", month_num: 2, year: params[:year], user_id: params[:user_id], isrecurring: true },
          { description: params[:description], amount: params[:amount], day: params[:day], month: "March", month_num: 3, year: params[:year], user_id: params[:user_id], isrecurring: true },
          { description: params[:description], amount: params[:amount], day: params[:day], month: "April", month_num: 4, year: params[:year], user_id: params[:user_id], isrecurring: true },
          { description: params[:description], amount: params[:amount], day: params[:day], month: "May", month_num: 5, year: params[:year], user_id: params[:user_id], isrecurring: true },
          { description: params[:description], amount: params[:amount], day: params[:day], month: "June", month_num: 6, year: params[:year], user_id: params[:user_id], isrecurring: true },
          { description: params[:description], amount: params[:amount], day: params[:day], month: "July", month_num: 7, year: params[:year], user_id: params[:user_id], isrecurring: true },
          { description: params[:description], amount: params[:amount], day: params[:day], month: "August", month_num: 8, year: params[:year], user_id: params[:user_id], isrecurring: true },
          { description: params[:description], amount: params[:amount], day: params[:day], month: "September", month_num: 9, year: params[:year], user_id: params[:user_id], isrecurring: true },
          { description: params[:description], amount: params[:amount], day: params[:day], month: "October", month_num: 10, year: params[:year], user_id: params[:user_id], isrecurring: true },
          { description: params[:description], amount: params[:amount], day: params[:day], month: "November", month_num: 11, year: params[:year], user_id: params[:user_id], isrecurring: true },
          { description: params[:description], amount: params[:amount], day: params[:day], month: "December", month_num: 12, year: params[:year], user_id: params[:user_id], isrecurring: true },
          { description: params[:description], amount: params[:amount], day: params[:day], month: "ALL", month_num: 0, year: params[:year], user_id: params[:user_id], isrecurring: true },
        ])
      redirect_to :back
    else
      Income.create(
        description: params[:description],
        amount: params[:amount],
        day: params[:day],
        month: params[:month],
        month_num: @month_id,
        year: params[:year],
        user_id: params[:user_id] )
      redirect_to :back
    end
  end

  def update
    @incomeToEdit = Income.find_by_id(params[:id])
    return unless @incomeToEdit.user_id === current_user.id
    if @incomeToEdit.month == "ALL"
      allToEdit = Income.where(day: @incomeToEdit[:day]).where(description: @incomeToEdit[:description]).where(year: @incomeToEdit[:year]).where(:user_id => current_user.id)
      allToEdit.update(
        description: params[:description],
        amount: params[:amount],
        day: params[:day])
      redirect_to :back
    else
      @incomeToEdit.update(
        description: params[:description],
        amount: params[:amount],
        day: params[:day])
      redirect_to :back
    end
  end


  def destroy
    puts "WHAT"
    # incomeToDelete = Income.where(:description => params[:description])
    incomeToDelete = Income.where(id: params[:id]).where(user_id: current_user.id)
    p incomeToDelete.first
    return unless incomeToDelete.first.user_id === current_user.id
    if incomeToDelete.first.month == "ALL"
      allToDelete = Income.where(day: incomeToDelete.first[:day]).where(description: incomeToDelete.first[:description]).where(year: incomeToDelete.first[:year]).where(:user_id => current_user.id)
      allToDelete.destroy_all
      redirect_to :back
    else
      incomeToDelete.destroy_all
      redirect_to :back
    end
  end



end
