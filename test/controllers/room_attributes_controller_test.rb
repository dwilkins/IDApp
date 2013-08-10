require 'test_helper'

class RoomAttributesControllerTest < ActionController::TestCase
  setup do
    @room_attribute = room_attributes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:room_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create room_attribute" do
    assert_difference('RoomAttribute.count') do
      post :create, room_attribute: { abbreviation: @room_attribute.abbreviation, name: @room_attribute.name }
    end

    assert_redirected_to room_attribute_path(assigns(:room_attribute))
  end

  test "should show room_attribute" do
    get :show, id: @room_attribute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @room_attribute
    assert_response :success
  end

  test "should update room_attribute" do
    patch :update, id: @room_attribute, room_attribute: { abbreviation: @room_attribute.abbreviation, name: @room_attribute.name }
    assert_redirected_to room_attribute_path(assigns(:room_attribute))
  end

  test "should destroy room_attribute" do
    assert_difference('RoomAttribute.count', -1) do
      delete :destroy, id: @room_attribute
    end

    assert_redirected_to room_attributes_path
  end
end
