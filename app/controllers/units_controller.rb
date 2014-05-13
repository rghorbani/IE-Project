class UnitsController < ApplicationController

  before_action :ban_resident_area, except: [:user_index, :show]
  before_action :authenticate_user!
  before_action :set_unit, only: [:show, :edit, :update, :destroy]

  # GET /units
  # GET /units.json
  def index
    @units = Unit.all
  end

  def user_index
    @units = current_user.units
  end

  # GET /units/1
  # GET /units/1.json
  def show
    if @unit.user != current_user
      redirect_to '/'
    end
  end

  # GET /units/new
  def new
    @unit = Unit.new
    @unit.building_id = params[:building_id]
    if(@unit.building.units.size >= @unit.building.units_cnt)
      redirect_to building_path(@unit.building_id), notice: "تعداد مجاز واحد برای این ساختمان تکمیل شده است."
    end
  end

  # GET /units/1/edit
  def edit
  end

  # POST /units
  # POST /units.json
  def create
    @unit = Unit.new(unit_params)

    respond_to do |format|
      if @unit.save
        if(params[:email] != nil)
          u = User.where(:email => params[:email]).first
          if(u == nil)
            u = User.create(:email => params[:email], :password => '1234', :password_confirmation => '1234')
            u.add_role :resident
            u.save!(:validate => false)
          end
          @unit.user_id = u.id
          @unit.save
          update_plans(@unit)
        end
        format.html { redirect_to building_path(@unit.building_id), notice: 'واحد با موفقیت ایجاد شد.' }
        format.json { render action: 'show', status: :created, location: @unit }
      else
        format.html { render action: 'new', :notice =>  'چرت' }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /units/1
  # PATCH/PUT /units/1.json
  def update
    @unit.user_id = User.select("id").find_by_email(params[:email])

    respond_to do |format|
      if @unit.update(unit_params)
        update_plans_update(@unit)
        format.html { redirect_to building_path(@unit.building_id), notice: 'واحد با موفقیت به روزرسانی شد.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1
  # DELETE /units/1.json
  def destroy
    @building_id = @unit.building_id
    @unit.destroy
    respond_to do |format|
      format.html { redirect_to building_path(@building_id) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_params
      params.require(:unit).permit(:user_id, :building_id, :floor_number, :side, :unit_number, :area, :resident_count)
    end


    def update_plans(unit)
      if(unit.building.plans.size == 0)
        @plan0 = Plan.create(:building_id => unit.building.id, :name => 'پلان همسان', :number => 0)
        Rate.create(:plan_id => @plan0.id, :unit_id => unit.id, :rate => 1)
        @plan1 = Plan.create(:building_id => unit.building.id, :name => 'پلان جمعیت', :number => 1)
        Rate.create(:plan_id => @plan1.id, :unit_id => unit.id, :rate => unit.resident_count)
        @plan2 = Plan.create(:building_id => unit.building.id, :name => 'پلان مساحت', :number => 2)
        Rate.create(:plan_id => @plan2.id, :unit_id => unit.id, :rate => unit.area)
      else
        @plan0 = Plan.where(:building_id => unit.building.id, :number => 0).first
        Rate.create(:plan_id => @plan0.id, :unit_id => unit.id, :rate => 1)
        @plan1 = Plan.where(:building_id => unit.building.id, :number => 1).first
        Rate.create(:plan_id => @plan1.id, :unit_id => unit.id, :rate => unit.resident_count)
        @plan2 = Plan.where(:building_id => unit.building.id, :number => 2).first
        Rate.create(:plan_id => @plan2.id, :unit_id => unit.id, :rate => unit.area)
      end
    end

    def update_plans_update(unit)
        @plan1 = Plan.where(:building_id => unit.building.id, :number => 1).first
        @rate = Rate.where(:plan_id => @plan1.id, :unit_id => unit.id).first
        @rate.rate = unit.resident_count
        @rate.save
        @plan2 = Plan.where(:building_id => unit.building.id, :number => 2).first
        @rate = Rate.where(:plan_id => @plan2.id, :unit_id => unit.id).first
        @rate.rate = unit.area
        @rate.save
    end
end
