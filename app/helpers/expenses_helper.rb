module ExpensesHelper
  def user_has_categories(user)
    if user.categories.empty?
        return false
    end
    return true
  end

  def each_category_has_subcategory(user)
    user.categories.each do |category|
      if category.subcategories.empty?
        return false
      end
    end
    return true
  end
end
