module DetailsHelper

  def total_html(total_budget, total_expense)
    if total_budget && total_expense
      difference = total_budget - total_expense
      if difference < 0
        return "<td> #{number_to_currency(total_budget)} </td> <td> #{number_to_currency(total_expense)} </td> <td style='color:red'> #{number_to_currency(total_budget - total_expense)}</td>".html_safe
      else
        return "<td> #{number_to_currency(total_budget)} </td> <td> #{number_to_currency(total_expense)} </td> <td> #{number_to_currency(total_budget - total_expense)}</td>".html_safe
      end
    elsif total_budget
      return "<td> #{number_to_currency(total_budget)} </td> <td> -</td> <td> #{number_to_currency(total_budget)}</td>".html_safe
    elsif total_expense
      return "<td> - </td> <td> #{number_to_currency(total_expense)} </td> <td style='color:red'> #{number_to_currency(-total_expense)}</td>".html_safe
    else
      return "<td> - </td> <td> - </td> <td> - </td>".html_safe
    end
  end

  def budget_display(subcategory)
    total_budget = subcategory.total_budget(@month, @year, current_user.id)
    total_expense = subcategory.total_expense(@month, @year, current_user.id)
    total_html(total_budget, total_expense)
  end

  def total_display(category)
    total_budget = category.month_budget_by_category(@month, @year, current_user.id)
    total_expense = category.month_expense_by_category(@month, @year, current_user.id)
    total_html(total_budget, total_expense)
  end

  def difference(num1, num2)
    if num1 - num2 < 0
      return "<td style='color:red'> #{number_to_currency(num1 - num2)} </td>".html_safe
    else
      return "<td> #{number_to_currency(num1 - num2)} </td>".html_safe
    end
  end
end
