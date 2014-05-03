class ChargeController < ApplicationController

  before_action :authenticate_user!
  
  def dashboard
  end

  def help
  end
end
