class SubcategoriesController < ApplicationController

  def index
    @user = current_user.id
    @user_hash = set_user
    @cats = find_categories
    @subcats = find_all_subcategories
  end

  def create
    # refactor when I figure out nested strong params
    Subcategory.create(
      name: params[:name],
      category_id: params[:subcategories][:category],
      user_id: params[:user_id])
    redirect_to :back
  end

  def update
    @subcategoryToEdit = find_subcategory_to_edit
    return unless @subcategoryToEdit.user_id === current_user.id
      @subcategoryToEdit.update(subcategory_params)
      redirect_to :back
  end

  def destroy
    toDelete = find_subcategory_to_edit
    return unless toDelete.user_id === current_user.id
      toDelete.destroy
      redirect_to :back
  end

  private

  def set_user
    User.find_by_id(current_user.id)
  end

  def find_all_subcategories
    Subcategory.where(:user_id => current_user.id).pluck(:name, :category_id, :id)
  end

  def find_subcategory_to_edit
    Subcategory.find_by_id(params[:id])
  end

  def subcategory_params
    params.permit(:name)
  end

  def find_categories
    Category.where(:user_id => current_user.id)
  end

end
