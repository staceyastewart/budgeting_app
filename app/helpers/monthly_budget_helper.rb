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

  def month_loop(styling, jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec)
    "
      <td class='text-center #{styling}'> #{jan} </td>
      <td class='text-center #{styling}'> #{feb} </td>
      <td class='text-center #{styling}'> #{mar} </td>
      <td class='text-center #{styling}'> #{apr} </td>
      <td class='text-center #{styling}'> #{may} </td>
      <td class='text-center #{styling}'> #{jun} </td>
      <td class='text-center #{styling}'> #{jul} </td>
      <td class='text-center #{styling}'> #{aug} </td>
      <td class='text-center #{styling}'> #{sep} </td>
      <td class='text-center #{styling}'> #{oct} </td>
      <td class='text-center #{styling}'> #{nov} </td>
      <td class='text-center #{styling}'> #{dec} </td>
    ".html_safe
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
    return month_loop("warning", jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec)
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
    return month_loop("success", jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec)
  end

  def month_links(year)
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    month_link_string = ""
    months.each do |month|
      month_link_string = month_link_string + "<th><a href='/monthly_budget/#{month}?year=#{year}&month=#{month}'>#{month[0..2]}</a></th>"
    end
    puts month_link_string
    return month_link_string.html_safe
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
