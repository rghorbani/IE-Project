class ChargeController < ApplicationController

  before_action :authenticate_user!
  require 'jalali_date'
  def dashboard
  	if user_signed_in? and !(current_user.has_role? :resident)
  		@bills = Array.new
  		current_user.buildings.each do |building|
  			building.expenses.each do |expense|
  				for bill in expense.bills
  					@bills << bill  			
  				end
  			end
  		end
  	end
  	if user_signed_in? and (current_user.has_role? :resident)
  		@bills = Array.new
  		current_user.units.each do |unit|
  				for bill in unit.bills
  					@bills << bill  			
  				end
  		end
  	end
  end


  def help
  end
end
