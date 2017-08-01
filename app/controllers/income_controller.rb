class IncomeController < ApplicationController

  before_filter :authenticate_user!

  def index
    @user_id = current_user.id
    @recurring = find_recurring_incomes
    @year = set_year
  end

  def show
    @user_id = current_user.id
    @month =  set_month
    @monthIncome = find_month_incomes
  end

  def create
    create_income
    redirect_to :back
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
    incomeToDelete = Income.where(id: params[:id]).where(user_id: current_user.id)
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

  private

  def set_year
    params[:year]
  end

  def set_month
    params[:id]
  end

  def find_recurring_incomes
    Income.where(:isrecurring => true).where(:month => "ALL").where(:year => params[:year]).where(:user_id => current_user.id)
  end

  def find_month_incomes
    Income.where(:month => @month).where(:year => params[:year]).where(:user_id => current_user.id)
  end

  def create_income
    months_array = ["ALL", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    if (params["month"] == "ALL")
      months_array.each do |month|
        new_month = month
        Income.create(description: params[:description], amount: params[:amount], day: params[:day], month: new_month, month_num: months_array.index(new_month), year: params[:year], user_id: params[:user_id], isrecurring: true)
      end
    else
      Income.create(
        description: params[:description],
        amount: params[:amount],
        day: params[:day],
        month: params[:month],
        month_num: @month_id,
        year: params[:year],
        user_id: params[:user_id] )
    end
  end



end
