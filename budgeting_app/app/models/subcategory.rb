class Subcategory < ApplicationRecord

  belongs_to :category
  has_many :expenses
  has_many :monthly_budgets

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
end
