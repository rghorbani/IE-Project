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

      @unit_count = get_unit_count
      @this_month = get_this_month_expense
      @not_arrivals = get_this_month_not_arrivals
      @arrivals = get_this_month_arrivals
      profile = best_pay
      if(profile == nil)
        @best_pay = "موجود نیست"
      else
        @best_pay = profile.first_name + " " + profile.last_name
      end
      @news = get_manager_news
    end

    if (current_user.has_role? :resident)
      @bills = Array.new
      current_user.units.each do |unit|
        for bill in unit.bills
         @bills << bill  			
        end
      end

      @unit_count = current_user.units.size
      @paid = get_this_month_paid
      @this_month = get_this_month_bill
      @not_paid = get_this_month_not_paid
      @news = get_resident_news
    end
   #@news = News.where('system = ?', 0).order("created_at DESC").limit(5)
 end


 def help
 end

 def get_resident_news
  allnews = Array.new
  current_user.units.each do |unit|
    for news in unit.building.news
      allnews << news
    end
  end
  allnews
 end

 def get_manager_news
  allnews = Array.new
  current_user.buildings.each do |building|
    for news in building.news
      allnews << news
    end
  end
  allnews
 end

 def get_this_month_not_paid
  cost = 0
  current_user.units.each do |unit|
    for bill in unit.bills
      if(bill.status == false)
        cost = cost + bill.price
      end
    end
  end
  cost
 end

 def get_this_month_bill
  cost = 0
  current_user.units.each do |unit|
    for bill in unit.bills
      cost = cost + bill.price
    end
  end
  cost
 end

 def get_this_month_paid
  paid = 0
  current_user.units.each do |unit|
    for bill in unit.bills
      if(bill.status == true)
        paid = paid + bill.price
      end
    end
  end
  paid
 end

 def get_unit_count
  unit_count = 0
  current_user.buildings.each do |building|
    for unit in building.units
      unit_count = unit_count + 1
    end
  end
  unit_count
end

def get_this_month_expense
  cost = 0
  current_user.buildings.each do |building|
    for expense in building.expenses
      if expense.blank?
        cost = cost + expense.price
      end
    end
  end
  cost
end

def get_this_month_arrivals
  cost = 0
  current_user.buildings.each do |building|
    for expense in building.expenses
        for bill in expense.bills
          if(bill.status == true)
            cost = cost + bill.price
          end
        end
    end
  end
  cost
end

def get_this_month_not_arrivals
  cost = 0
  current_user.buildings.each do |building|
    for expense in building.expenses
        for bill in expense.bills
          if(bill.status == false)
            cost = cost + bill.price
          end
        end
    end
  end
  cost
end

def best_pay
  num_of_paid = 0
  profile = nil
  current_user.buildings.each do |building|
    for unit in building.units
        new_num_of_paid = 0
        for bill in unit.bills
          if(bill.status == true)
            new_num_of_paid = new_num_of_paid + 1
          end
        end
        if new_num_of_paid > num_of_paid
          num_of_paid = new_num_of_paid
          profile = unit.user.profile
        end
    end
  end
  profile
end


end
