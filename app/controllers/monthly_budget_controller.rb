class MonthlyBudgetController < ApplicationController

  before_filter :authenticate_user!

  def index
    @user = current_user.id
    @user_hash = set_user
    @cats = Category.where(:user_id => current_user.id)
    @subcats = Subcategory.where(:user_id => current_user.id).pluck(:name, :category_id, :id)
    @budgets = MonthlyBudget.where(:user_id => current_user.id).where(:year => params[:year]).order(:month_num)
    @year = params[:year]
    # @date = Date.today
    # @month = @date.strftime("%B")
  end


  def show
    @user = current_user.id
    @user_hash = set_user
    # @user_id = current_user.id
    month = params[:id]
    @month = params[:id]
    @year = Time.now.year
    # @subcat = Subcategory.where(:user_id => current_user.id).select("DISTINCT ON (name) *")
    @cats = Category.where(:user_id => current_user.id)
    @subcats = Subcategory.where(:user_id => current_user.id).pluck(:name, :category_id, :id)
    @budgets = MonthlyBudget.where(:user_id => current_user.id).where(:year => params[:year]).where(:month => params[:id])


    @monthlyBudget = Subcategory
      .where(:user_id => current_user.id)
      .where(:month => month)
  end


  def create
    checkForExistingRecord = MonthlyBudget.where(:subcategory_id =>params[:monthly_budget][:subcategory])
    return unless checkForExistingRecord.blank?
    MonthlyBudget.create(
      [
        {month: "January", month_num: 1, year: params[:year], amount: params[:amount], user_id: params[:user_id], subcategory_id: params[:monthly_budget][:subcategory]},
        {month: "February", month_num: 2, year: params[:year], amount: params[:amount], user_id: params[:user_id], subcategory_id: params[:monthly_budget][:subcategory]},
        {month: "March", month_num: 3, year: params[:year], amount: params[:amount], user_id: params[:user_id], subcategory_id: params[:monthly_budget][:subcategory]},
        {month: "April", month_num: 4, year: params[:year], amount: params[:amount], user_id: params[:user_id], subcategory_id: params[:monthly_budget][:subcategory]},
        {month: "May", month_num: 5, year: params[:year], amount: params[:amount], user_id: params[:user_id], subcategory_id: params[:monthly_budget][:subcategory]},
        {month: "June", month_num: 6, year: params[:year], amount: params[:amount], user_id: params[:user_id], subcategory_id: params[:monthly_budget][:subcategory]},
        {month: "July", month_num: 7, year: params[:year], amount: params[:amount], user_id: params[:user_id], subcategory_id: params[:monthly_budget][:subcategory]},
        {month: "August", month_num: 8, year: params[:year], amount: params[:amount], user_id: params[:user_id], subcategory_id: params[:monthly_budget][:subcategory]},
        {month: "September", month_num: 9, year: params[:year], amount: params[:amount], user_id: params[:user_id], subcategory_id: params[:monthly_budget][:subcategory]},
        {month: "October", month_num: 10, year: params[:year], amount: params[:amount], user_id: params[:user_id], subcategory_id: params[:monthly_budget][:subcategory]},
        {month: "November", month_num: 11, year: params[:year], amount: params[:amount], user_id: params[:user_id], subcategory_id: params[:monthly_budget][:subcategory]},
        {month: "December", month_num: 12, year: params[:year], amount: params[:amount], user_id: params[:user_id], subcategory_id: params[:monthly_budget][:subcategory]}
      ])
    redirect_to :back
  end


  def update
    @budget = MonthlyBudget.find_by_id(params[:id])
    p params
    return unless @budget.user_id === current_user.id
    @budget.update(
      amount: params[:amount]
      )
    redirect_to :back
  end


  def destroy
    puts params
    puts params[:id]
    p params
    puts @month
    puts params[:month]
    if params[:month]
      firstDelete = MonthlyBudget.where(:id => params[:id])
      firstDelete.destroy_all
      redirect_to :back
    else
      firstDelete = MonthlyBudget.where(:id => params[:id])
      allToDeleteId =  firstDelete.first.subcategory_id
      budgetToDelete = MonthlyBudget.where(:subcategory_id => allToDeleteId)
      budgetToDelete.destroy_all
      redirect_to :back
    end
  end

  private

  def set_user
    User.find_by_id(current_user.id)
  end

end
