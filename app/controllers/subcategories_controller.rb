class SubcategoriesController < ApplicationController

  def index
    @user = current_user.id
    @user_hash = User.find_by_id(current_user.id)
    @cats = Category.where(:user_id => current_user.id)
    @subcats = Subcategory.where(:user_id => current_user.id).pluck(:name, :category_id, :id)
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

  def update
    @subcategoryToEdit = Subcategory.find_by_id(params[:id])
    return unless @subcategoryToEdit.user_id === current_user.id
      @subcategoryToEdit.update(
        name: params[:name])
      redirect_to :back
  end

  def destroy
    toDelete = Subcategory.find_by_id(params[:id])
    return unless toDelete.user_id === current_user.id
      toDelete.destroy
      redirect_to :back
  end

end
