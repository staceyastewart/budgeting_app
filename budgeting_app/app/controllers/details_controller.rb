class DetailsController < ApplicationController

  def index
    @month = params[:month]
    @year = params[:year]
    @categories = Category.where(user_id: current_user.id)
  end

end
