class Subcategory < ApplicationRecord

  belongs_to :category
  has_many :expenses, dependent: :destroy
  has_many :monthly_budgets, dependent: :destroy

  def total_budget(month, year, user)
    monthly_budgets
      .where(
        month: month,
        year: year,
        user_id: user
        )
      .pluck(:amount)
      .inject(&:+)
  end

  def total_expense(month, year, user, chart)
    # if chart == true
    #   expenses
    #     .where(
    #       month: month,
    #       year: year,
    #       user_id: user
    #       )
    #     .pluck(:amount)
    #     .inject(&:+)
    #   if prices_array[0] < 0
    #     return [1]
    #   end
    # else
      expenses
        .where(
          month: month,
          year: year,
          user_id: user
          )
        .pluck(:amount)
        .inject(&:+)
    # end
  end


end
