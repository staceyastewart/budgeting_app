class Expense < ApplicationRecord

  belongs_to :user
  belongs_to :subcategory

  scope :actual, -> (month, year, subcat, user) { where(month: month, year: year, subcategory_id: subcat, user_id: user).pluck(:amount).inject(&:+) }
end
