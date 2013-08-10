require 'test_helper'

class RoomRoomAttributeLinksControllerTest < ActionController::TestCase
  setup do
    @room_room_attribute_link = room_room_attribute_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:room_room_attribute_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create room_room_attribute_link" do
    assert_difference('RoomRoomAttributeLink.count') do
      post :create, room_room_attribute_link: { end_date: @room_room_attribute_link.end_date, room_attribute_id: @room_room_attribute_link.room_attribute_id, room_id: @room_room_attribute_link.room_id, start_date: @room_room_attribute_link.start_date }
    end

    assert_redirected_to room_room_attribute_link_path(assigns(:room_room_attribute_link))
  end

  test "should show room_room_attribute_link" do
    get :show, id: @room_room_attribute_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @room_room_attribute_link
    assert_response :success
  end

  test "should update room_room_attribute_link" do
    patch :update, id: @room_room_attribute_link, room_room_attribute_link: { end_date: @room_room_attribute_link.end_date, room_attribute_id: @room_room_attribute_link.room_attribute_id, room_id: @room_room_attribute_link.room_id, start_date: @room_room_attribute_link.start_date }
    assert_redirected_to room_room_attribute_link_path(assigns(:room_room_attribute_link))
  end

  test "should destroy room_room_attribute_link" do
    assert_difference('RoomRoomAttributeLink.count', -1) do
      delete :destroy, id: @room_room_attribute_link
    end

    assert_redirected_to room_room_attribute_links_path
  end
end
