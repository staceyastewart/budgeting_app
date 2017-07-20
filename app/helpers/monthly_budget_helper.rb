module MonthlyBudgetHelper

  def each_category_has_child(user)
    user.categories.each do |category|
      if category.subcategories.empty?
        return false
      end
    end
    return true
  end

  def user_has_categories(user)
    if user.categories.empty?
        return false
    end
    return true
  end

  def category_totals_by_month(category, year, user)
    jan = category.month_budget_by_category("January", year, user)
    feb = category.month_budget_by_category("February", year, user)
    mar = category.month_budget_by_category("March", year, user)
    apr = category.month_budget_by_category("April", year, user)
    may = category.month_budget_by_category("May", year, user)
    jun = category.month_budget_by_category("June", year, user)
    jul = category.month_budget_by_category("July", year, user)
    aug = category.month_budget_by_category("August", year, user)
    sep = category.month_budget_by_category("September", year, user)
    oct = category.month_budget_by_category("October", year, user)
    nov = category.month_budget_by_category("November", year, user)
    dec = category.month_budget_by_category("December", year, user)
    return "
      <td class='text-center warning'> #{jan} </td>
      <td class='text-center warning'> #{feb} </td>
      <td class='text-center warning'> #{mar} </td>
      <td class='text-center warning'> #{apr} </td>
      <td class='text-center warning'> #{may} </td>
      <td class='text-center warning'> #{jun} </td>
      <td class='text-center warning'> #{jul} </td>
      <td class='text-center warning'> #{aug} </td>
      <td class='text-center warning'> #{sep} </td>
      <td class='text-center warning'> #{oct} </td>
      <td class='text-center warning'> #{nov} </td>
      <td class='text-center warning'> #{dec} </td>
    ".html_safe
  end

  def overall_total_by_month(user, year)
    jan = user.total_month_budget("January", year)
    feb = user.total_month_budget("February", year)
    mar = user.total_month_budget("March", year)
    apr = user.total_month_budget("April", year)
    may = user.total_month_budget("May", year)
    jun = user.total_month_budget("June", year)
    jul = user.total_month_budget("July", year)
    aug = user.total_month_budget("August", year)
    sep = user.total_month_budget("September", year)
    oct = user.total_month_budget("October", year)
    nov = user.total_month_budget("November", year)
    dec = user.total_month_budget("December", year)
    return "
      <td class='text-center success'> #{jan} </td>
      <td class='text-center success'> #{feb} </td>
      <td class='text-center success'> #{mar} </td>
      <td class='text-center success'> #{apr} </td>
      <td class='text-center success'> #{may} </td>
      <td class='text-center success'> #{jun} </td>
      <td class='text-center success'> #{jul} </td>
      <td class='text-center success'> #{aug} </td>
      <td class='text-center success'> #{sep} </td>
      <td class='text-center success'> #{oct} </td>
      <td class='text-center success'> #{nov} </td>
      <td class='text-center success'> #{dec} </td>
    ".html_safe
  end


  def category_totals_by_month_individual(category, year, user)
    month = category.month_budget_by_category(params[:id], year, user)
    return "
      <td class='text-center warning'> #{month} </td>
     ".html_safe
  end

  def overall_total_by_month_individual(user, year)
    month = user.total_month_budget(params[:id], year)
    return "
      <td class='text-center success'> #{month} </td>
    ".html_safe
  end

end
