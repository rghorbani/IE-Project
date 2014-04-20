class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  # GET /plans
  # GET /plans.json
  def index
    @building_id = params[:building_id]
    if(@building_id != nil)
      @plans = Plan.all.where(:building_id => @building_id)
    else
      @plans = Plan.all
    end
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
  end

  # GET /plans/new
  def new
    @plan = Plan.new
    @plan.building_id = params[:building_id]
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans
  # POST /plans.json
  def create
    @plan = Plan.new(plan_params)
    respond_to do |format|
      if @plan.save
        @rates_hash = {}
        params.each do |name, value|
          if /unit_(.+)$/.match(name)
            @rates_hash[$1] = value
          end
        end
        @rates_hash.each do |name,value|
          Rate.create(:plan_id => @plan.id, :unit_id => name, :rate => value)
        end
        format.html { redirect_to plans_path(:building_id => @plan.building_id), notice: 'Plan was successfully created.' }
        format.json { render action: 'show', status: :created, location: @plan }
      else
        format.html { render action: 'new' }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    @rates_hash = {}
    params.each do |name, value|
      if /unit_(.+)$/.match(name)
        @rates_hash[$1] = value
      end
    end
    @rates_hash.each do |name,value|
      Rate.create(:plan_id => @plan.id, :unit_id => name, :rate => value)
    end
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to plans_path(:building_id => @plan.building_id), notice: 'Plan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @building_id = @plan.building_id
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_path(:building_id => @building_id) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.require(:plan).permit(:building_id, :name, :number)
    end
end
