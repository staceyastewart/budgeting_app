class DetailsController < ApplicationController

  def index
    @month = set_month
    @year = set_year
    @categories = find_categories
    @user = set_user
  end

  private

  def set_user
    User.find_by_id(current_user.id)
  end

  def set_month
    params[:month]
  end

  def set_year
    params[:year]
  end

  def find_categories
    Category.where(user_id: current_user.id)
  end

end
