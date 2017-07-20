module SubcategoriesHelper
  def user_has_categories(user)
    if user.categories.empty?
        return false
    end
    return true
  end
end
