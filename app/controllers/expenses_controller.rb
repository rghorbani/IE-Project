class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # GET /expenses
  # GET /expenses.json
  def index
    @building_id = params[:building_id]
    @building = Building.find(@building_id)
    if(@building_id != nil)
      @expenses = Expense.all.where(:building_id => @building_id)
    else
      @expenses = Expense.all
    end
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
    @building_id = @expense.building_id
    @building = Building.find(@building_id)
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
    @expense.building_id = params[:building_id]
    @building_id = params[:building_id]
    @building = Building.find(@building_id)
    if @building.plans.size == 0
      redirect_to plans_path(:building_id => @building_id), notice: "پلان هزینه ای برای این ساختمان موجود نیست."
    end
  end

  # GET /expenses/1/edit
  def edit
    @building_id = @expense.building_id
    @building = Building.find(@building_id)
    redirect_to expense_path(@expense), notice: "در حال حاضر امکان ویرایش هزینه در سیستم ممکن نیست."
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(expense_params)
    respond_to do |format|
      if @expense.save
        @plan = Plan.find(params[:plan_id])
        sum = 0
        @plan.rates.each do |rate|
          sum += rate.rate
        end
        @plan.rates.each do |rate|
          next if(rate.rate == 0)
          Bill.create(:expense_id => @expense.id, :unit_id => rate.unit_id, :price => (rate.rate*(@expense.price))/sum, :deadline => @expense.deadline, :description => @expense.description, :status => false)
        end
        format.html { redirect_to expenses_path(:building_id => @expense.building_id), notice: 'هزینه برای این ساختمان با موفقیت ایجاد شد.' }
        format.json { render action: 'show', status: :created, location: @expense }
      else
        format.html { render action: 'new' }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to expenses_path(:building_id => @expense.building_id), notice: 'Expense was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @building_id = @expense.building_id
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_path(:building_id => @building_id) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:building_id, :price, :description, :release_date, :deadline, :number)
    end
end
