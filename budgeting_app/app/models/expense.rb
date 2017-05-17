class Expense < ApplicationRecord

  def index
    @user_id = current_user.id


  end


end
