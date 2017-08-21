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
    if chart == true
      price_array = expenses
        .where(
          month: month,
          year: year,
          user_id: user
          )
        .pluck(:amount)
      prices_without_negatives = []
        price_array.each do |price|
          if price < 0
            prices_without_negatives.push(0)
          else
            prices_without_negatives.push(price)
          end
        end
    else
      expenses
        .where(
          month: month,
          year: year,
          user_id: user
          )
        .pluck(:amount)
        .inject(&:+)
    end
  end


end
