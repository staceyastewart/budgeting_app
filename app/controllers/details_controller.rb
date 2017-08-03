class DetailsController < ApplicationController

  def index
    @month = params[:month]
    @year = params[:year]
    @categories = find_categories
    @user = set_user
  end

  private

  def set_user
    User.find_by_id(current_user.id)
  end


  def find_categories
    Category.where(user_id: current_user.id)
  end

end
