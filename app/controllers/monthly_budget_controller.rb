class MonthlyBudgetController < ApplicationController

  before_filter :authenticate_user!

  def index
    @user = current_user.id
    @user_hash = set_user
    @cats = find_all_categories
    @subcats = find_all_subcategories
    @budgets = find_all_budgets
    @year = set_year
  end

  def show
    @user = current_user.id
    @user_hash = set_user
    @month = set_month
    @year = set_year
    @cats = find_all_categories
    @subcats = find_all_subcategories
    @budgets = find_month_budget
  end

  def create
    create_budgets
    redirect_back(fallback_location: root_path)
  end

  def update
    @budget = budget_to_update
    return unless @budget.user_id === current_user.id
    @budget.update(budget_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    delete_budget
    redirect_back(fallback_location: root_path)
  end

  private

  def set_user
    User.find_by_id(current_user.id)
  end

  def set_month
    params[:id]
  end

  def set_year
    params[:year]
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

  def checkForExistingRecord
    MonthlyBudget.where(:subcategory_id =>params[:monthly_budget][:subcategory])
  end

  def create_budgets
    months_array = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    return unless checkForExistingRecord.blank?
    months_array.each do |month|
      new_month = month
      new_month_number = months_array.index(new_month) + 1
      MonthlyBudget.create(month: new_month, month_num: new_month_number, year: params[:year], amount: params[:amount], user_id: params[:user_id], subcategory_id: params[:monthly_budget][:subcategory])
    end
  end

  def delete_budget
    if params[:month]
      firstDelete = budget_to_delete
      firstDelete.destroy_all
    else
      firstDelete = budget_to_delete
      allToDeleteId =  firstDelete.first.subcategory_id
      budgetToDelete = MonthlyBudget.where(:subcategory_id => allToDeleteId)
      budgetToDelete.destroy_all
    end
  end

end
