require 'test_helper'

class GeometriesControllerTest < ActionController::TestCase
  setup do
    @geometry = geometries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:geometries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create geometry" do
    assert_difference('Geometry.count') do
      post :create, geometry: { geometry: @geometry.geometry, room_id: @geometry.room_id }
    end

    assert_redirected_to geometry_path(assigns(:geometry))
  end

  test "should show geometry" do
    get :show, id: @geometry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @geometry
    assert_response :success
  end

  test "should update geometry" do
    patch :update, id: @geometry, geometry: { geometry: @geometry.geometry, room_id: @geometry.room_id }
    assert_redirected_to geometry_path(assigns(:geometry))
  end

  test "should destroy geometry" do
    assert_difference('Geometry.count', -1) do
      delete :destroy, id: @geometry
    end

    assert_redirected_to geometries_path
  end
end
