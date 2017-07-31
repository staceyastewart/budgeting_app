class MonthlyBudgetController < ApplicationController

  before_filter :authenticate_user!

  def index
    @user = current_user.id
    @user_hash = set_user
    @cats = find_all_categories
    @subcats = find_all_subcategories
    @budgets = find_all_budgets
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
    @cats = find_all_categories
    @subcats = find_all_subcategories
    @budgets = find_month_budget


    @monthlyBudget = Subcategory
      .where(:user_id => current_user.id)
      .where(:month => month)
  end


  def create
    months_array = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    checkForExistingRecord = MonthlyBudget.where(:subcategory_id =>params[:monthly_budget][:subcategory])
    return unless checkForExistingRecord.blank?
    months_array.each do |month|
      new_month = month
      new_month_number = months_array.index(new_month) + 1
      MonthlyBudget.create(month: new_month, month_num: new_month_number, year: params[:year], amount: params[:amount], user_id: params[:user_id], subcategory_id: params[:monthly_budget][:subcategory])
    end
    redirect_to :back
  end


  def update
    @budget = budget_to_update
    return unless @budget.user_id === current_user.id
    @budget.update(budget_params)
    redirect_to :back
  end


  def destroy
    if params[:month]
      firstDelete = budget_to_delete
      firstDelete.destroy_all
      redirect_to :back
    else
      firstDelete = budget_to_delete
      allToDeleteId =  firstDelete.first.subcategory_id
      # I think below also needs user ID
      budgetToDelete = MonthlyBudget.where(:subcategory_id => allToDeleteId)
      budgetToDelete.destroy_all
      redirect_to :back
    end
  end

  private

  def set_user
    User.find_by_id(current_user.id)
  end

  def find_all_budgets
    MonthlyBudget.where(:user_id => current_user.id).where(:year => params[:year]).order(:month_num)
  end

  def find_month_budget
    MonthlyBudget.where(:user_id => current_user.id).where(:year => params[:year]).where(:month => params[:id])
  end

  def find_all_categories
    Category.where(:user_id => current_user.id)
  end

  def find_all_subcategories
    Subcategory.where(:user_id => current_user.id).pluck(:name, :category_id, :id)
  end

  def budget_to_update
    MonthlyBudget.find_by_id(params[:id])
  end

  def budget_to_delete
    MonthlyBudget.where(:id => params[:id])
  end

  def budget_params
    params.permit(:amount)
  end

end
