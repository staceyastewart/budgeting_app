class HomeController < ApplicationController
  def index
    @date = Date.today
    @month = @date.strftime("%B")
    @year = Time.now.year
  end
end
