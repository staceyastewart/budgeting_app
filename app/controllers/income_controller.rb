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
    @incomeToEdit = income_to_edit
    return unless @incomeToEdit.user_id === current_user.id
    if @incomeToEdit.month == "ALL"
      allToEdit = recurring_incomes_to_edit
      allToEdit.update(income_params)
    else
      @incomeToEdit.update(income_params)
    end
    redirect_to :back
  end

  def destroy
    incomeToDelete = income_to_delete
    return unless incomeToDelete.first.user_id === current_user.id
    if incomeToDelete.first.month == "ALL"
      allToDelete = recurring_incomes_to_delete(incomeToDelete)
      allToDelete.destroy_all
    else
      incomeToDelete.destroy_all
    end
    redirect_to :back
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

  def income_params
    params.permit(:description, :amount, :day)
  end

  def income_to_edit
    Income.find_by_id(params[:id])
  end

  def income_to_delete
    Income.where(id: params[:id]).where(user_id: current_user.id)
  end

  def recurring_incomes_to_edit
    Income.where(day: @incomeToEdit[:day]).where(description: @incomeToEdit[:description]).where(year: @incomeToEdit[:year]).where(:user_id => current_user.id)
  end

  def recurring_incomes_to_delete(to_delete)
    Income.where(day: to_delete.first[:day]).where(description: to_delete.first[:description]).where(year: to_delete.first[:year]).where(:user_id => current_user.id)
  end

  def create_income
    # params[:description] = "HELLO THIS IS A TEST"
    months_array = ["ALL", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    if (params["month"] == "ALL")
      months_array.each do |month|
        new_month = month
        Income.create(
          description: params[:description],
          amount: params[:amount],
          day: params[:day],
          month: new_month,
          month_num: months_array.index(new_month),
          year: params[:year],
          user_id: params[:user_id],
          isrecurring: true)
      end
    else
      Income.create(
        description: params[:description],
        amount: params[:amount],
        day: params[:day],
        month: params[:month],
        month_num: @month_id,
        year: params[:year],
        user_id: params[:user_id])
    end
  end



end
