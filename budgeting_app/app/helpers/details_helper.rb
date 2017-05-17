module DetailsHelper

  def budget_display(subcategory)
    total_budget = subcategory.total_budget(@month, @year, current_user.id)
    total_expense = subcategory.total_expense(@month, @year, current_user.id)

    if total_budget && total_expense
      difference = total_budget - total_expense
      if difference < 0
        return "<td> #{number_to_currency(total_budget)} </td> <td> #{number_to_currency(total_expense)} </td> <td style='color:red'> #{number_to_currency(total_budget - total_expense)}</td>".html_safe
      else
        return "<td> #{number_to_currency(total_budget)} </td> <td> #{number_to_currency(total_expense)} </td> <td> #{number_to_currency(total_budget - total_expense)}</td>".html_safe
      end
    elsif total_budget
      return "<td> #{number_to_currency(total_budget)} </td> <td> 0</td> <td> #{number_to_currency(total_budget)}</td>".html_safe
    elsif total_expense
      return "<td> 0 </td> <td> #{number_to_currency(total_expense)} </td> <td style='color:red'> #{number_to_currency(-total_expense)}</td>".html_safe
    else
      return "<td> 0 </td> <td> 0 </td> <td> 0 </td>".html_safe
    end
  end

  def total_display(category)
    total_budget = category.month_budget_by_category(@month, @year, current_user.id)
    total_expense = category.month_expense_by_category(@month, @year, current_user.id)
    if total_budget && total_expense
      difference = total_budget - total_expense
      if difference < 0
        return "<td> #{number_to_currency(total_budget)} </td> <td> #{number_to_currency(total_expense)} </td> <td style='color:red'> #{number_to_currency(total_budget - total_expense)}</td>".html_safe
      else
        return "<td> #{number_to_currency(total_budget)} </td> <td> #{number_to_currency(total_expense)} </td> <td> #{number_to_currency(total_budget - total_expense)}</td>".html_safe
      end
    elsif total_budget
      return "<td> #{number_to_currency(total_budget)} </td> <td> 0</td> <td> #{number_to_currency(total_budget)}</td>".html_safe
    elsif total_expense
      return "<td> 0 </td> <td> #{number_to_currency(total_expense)} </td> <td style='color:red'> #{number_to_currency(-total_expense)}</td>".html_safe
    else
      return "<td> 0 </td> <td> 0 </td> <td> 0 </td>".html_safe
    end
  end

end
