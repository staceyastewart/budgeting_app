class CategoriesController < ApplicationController
  def index
    @user = current_user.id
    @categories = Category.where(:user_id => current_user.id)

  end

  def create
    return unless current_user.id.to_s == params[:user_id]
    Category.create(
      title: params[:title],
      user_id: params[:user_id])
    redirect_to :back
  end

  def update
    @categoryToEdit = Category.find_by_id(params[:id])
    return unless @categoryToEdit.user_id === current_user.id
      @categoryToEdit.update(
        title: params[:title])
      redirect_to :back
  end

  def destroy
    toDelete = Category.find_by_id(params[:id])
    return unless toDelete.user_id === current_user.id
      toDelete.destroy
      redirect_to :back
  end

end
