class ChargeController < ApplicationController

  before_action :authenticate_user!
  require 'jalali_date'

  def dashboard
  	if not current_user.has_role? :resident
  		@bills = Array.new
  		current_user.buildings.each do |building|
  			building.expenses.each do |expense|
  				for bill in expense.bills
  					@bills << bill  			
  				end
  			end
  		end
  	end
    @news = News.where('system = ?', 0).order("created_at DESC").limit(5)
  end


  def help
  end
end
