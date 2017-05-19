class HomeController < ApplicationController
  def index
    @date = Date.today
    @month = @date.strftime("%B")
  end
end
