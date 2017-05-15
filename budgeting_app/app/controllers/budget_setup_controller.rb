class BudgetSetupController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user_id = current_user.id
    # @subcat = Subcategory.distinct.pluck(:name)
    # @subcat = Subcategory.all.map(&:name).uniq
    # @subcat = Subcategory.where(:user_id => current_user.id).select("DISTINCT ON (name)").group(:name)
    @subcat = Subcategory.where(:user_id => current_user.id).select("DISTINCT ON (name) *")
    @group = Subcategory.select(:category).group(:category)
    puts @group
    @monthAmounts = Subcategory.where(:user_id => current_user.id).order(:month_num)

    # puts @subcat

  end


  def show
    @user_id = current_user.id
    month = params[:id]
    @subcat = Subcategory.where(:user_id => current_user.id).select("DISTINCT ON (name) *")
    @monthlyBudget = Subcategory
      .where(:user_id => current_user.id)
      .where(:month => month)
  end


  def create
    puts params[:budget][:month]
    if (params["budget"]["month"] == "ALL")
      Subcategory.create(
        [
          { name: params[:name], amount: params[:amount], category: params[:category], month: "January", month_num: 1, year: params[:year], user_id: params[:user_id] },
          { name: params[:name], amount: params[:amount], category: params[:category], month: "February", month_num: 2, year: params[:year], user_id: params[:user_id] },
          { name: params[:name], amount: params[:amount], category: params[:category], month: "March", month_num: 3, year: params[:year], user_id: params[:user_id] },
          { name: params[:name], amount: params[:amount], category: params[:category], month: "April", month_num: 4, year: params[:year], user_id: params[:user_id] },
          { name: params[:name], amount: params[:amount], category: params[:category], month: "May", month_num: 5, year: params[:year], user_id: params[:user_id] },
          { name: params[:name], amount: params[:amount], category: params[:category], month: "June", month_num: 6, year: params[:year], user_id: params[:user_id] },
          { name: params[:name], amount: params[:amount], category: params[:category], month: "July", month_num: 7, year: params[:year], user_id: params[:user_id] },
          { name: params[:name], amount: params[:amount], category: params[:category], month: "August", month_num: 8, year: params[:year], user_id: params[:user_id] },
          { name: params[:name], amount: params[:amount], category: params[:category], month: "September", month_num: 9, year: params[:year], user_id: params[:user_id] },
          { name: params[:name], amount: params[:amount], category: params[:category], month: "October", month_num: 10, year: params[:year], user_id: params[:user_id] },
          { name: params[:name], amount: params[:amount], category: params[:category], month: "November", month_num: 11, year: params[:year], user_id: params[:user_id] },
          { name: params[:name], amount: params[:amount], category: params[:category], month: "December", month_num: 12, year: params[:year], user_id: params[:user_id] }
        ])
      redirect_to :back
    end
  end

  def edit
    puts "EDIT"
    puts params

  end

  def update
    puts "UPDATE"
    @subcategory = Subcategory.find_by_id(params[:id])
    puts params
    return unless @subcategory.user_id === current_user.id
    @subcategory.update(
      name: params[:name],
      amount: params[:amount],
      category: params[:category],
      month: params[:budget][:month],
      year: params[:year],
      user_id: params[:user_id]
      )
    redirect_to :back
  end

end
