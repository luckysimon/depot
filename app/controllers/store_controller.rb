class StoreController < ApplicationController
  def index
    @count=index_visit_counter
    @products = Product.order(:title)
    @counter_message = "You have visited here for #{@count} times." if @count >5
  end

  private
  def index_visit_counter
    if session[:counter].nil?
      session[:counter] = 0
    else
      session[:counter] += 1
    end
  end
end
