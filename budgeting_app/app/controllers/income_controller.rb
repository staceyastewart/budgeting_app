class IncomeController < ApplicationController
  def index
    @user_id = current_user.id
    # @recurring = Income.where(:isrecurring => true)
    @recurring = Income.where(:isrecurring => true)
  end

  def show
    @user_id = current_user.id
    month =  params[:id]
    @monthIncome = Income.where(:month => month)
    puts @monthIncome
  end

  def create
    puts params
    puts params["id"]

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
          { description: params[:description], amount: params[:amount], day: params[:day], month: "December", month_num: 12, year: params[:year], user_id: params[:user_id], isrecurring: true }
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
    @incomeToEdit.update(
        description: params[:description],
        amount: params[:amount],
        day: params[:day],
        month: params[:month],
        month_num: @month_id,
        year: params[:year] )
      redirect_to :back

  end



end
