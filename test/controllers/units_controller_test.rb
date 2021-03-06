require 'test_helper'

class UnitsControllerTest < ActionController::TestCase
  setup do
    @unit = units(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unit" do
    assert_difference('Unit.count') do
      post :create, unit: { area: @unit.area, building_id: @unit.building_id, floor_number: @unit.floor_number, resident_count: @unit.resident_count, side: @unit.side, unit_number: @unit.unit_number, user_id: @unit.user_id }
    end

    assert_redirected_to unit_path(assigns(:unit))
  end

  test "should show unit" do
    get :show, id: @unit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unit
    assert_response :success
  end

  test "should update unit" do
    patch :update, id: @unit, unit: { area: @unit.area, building_id: @unit.building_id, floor_number: @unit.floor_number, resident_count: @unit.resident_count, side: @unit.side, unit_number: @unit.unit_number, user_id: @unit.user_id }
    assert_redirected_to unit_path(assigns(:unit))
  end

  test "should destroy unit" do
    assert_difference('Unit.count', -1) do
      delete :destroy, id: @unit
    end

    assert_redirected_to units_path
  end
end
