module BudgetSetupHelper

  def grabMonth(obj, countr)
    case countr
    when 1
      @monthOfYear = "January"
    when 2
      @monthOfYear = "February"
    when 3
      @monthOfYear = "March"
    else
      @monthOfYear = "NONE"
    end
  end
end
