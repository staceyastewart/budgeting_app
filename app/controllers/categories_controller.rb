class CategoriesController < ApplicationController
  def index
    @user = current_user.id
    @categories = find_all_categories
  end

  def create
    return unless current_user.id.to_s == find_user
    Category.create(category_params)
    redirect_back(fallback_location: root_path)
  end

  def update
    @categoryToEdit = find_category_to_edit
    return unless @categoryToEdit.user_id === current_user.id
      @categoryToEdit.update(category_params)
      redirect_back(fallback_location: root_path)
  end

  def destroy
    toDelete = find_category_to_edit
    return unless toDelete.user_id === current_user.id
      toDelete.destroy
      redirect_back(fallback_location: root_path)
  end

  private

  def find_user
    params[:user_id]
  end

  def category_params
    params.permit(:title, :user_id)
  end

  def find_all_categories
    Category.where(:user_id => current_user.id)
  end

  def find_category_to_edit
    Category.find_by_id(params[:id])
  end


end
