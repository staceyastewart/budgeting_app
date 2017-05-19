class SubcategoriesController < ApplicationController

  def index
    @user = current_user.id
    @cats = Category.where(:user_id => current_user.id)
    @subcats = Subcategory.where(:user_id => current_user.id).pluck(:name, :category_id)
  end

  def create
    puts params[:subcategories][:category].to_i.class
    @cat = params[:subcategories][:category].to_i
    puts params[:user_id].class
    Subcategory.create(
      name: params[:name],
      category_id: params[:subcategories][:category],
      user_id: params[:user_id])
    redirect_to :back
  end

end
