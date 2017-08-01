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
    months_array = ["ALL", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    if (params["month"] == "ALL")
      months_array.each do |month|
        new_month = month
        Income.create(description: params[:description], amount: params[:amount], day: params[:day], month: new_month, month_num: months_array.index(new_month), year: params[:year], user_id: params[:user_id], isrecurring: true)
      end
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
