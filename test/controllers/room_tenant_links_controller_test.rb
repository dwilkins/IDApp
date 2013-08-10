require 'test_helper'

class RoomTenantLinksControllerTest < ActionController::TestCase
  setup do
    @room_tenant_link = room_tenant_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:room_tenant_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create room_tenant_link" do
    assert_difference('RoomTenantLink.count') do
      post :create, room_tenant_link: { end_date: @room_tenant_link.end_date, room_id: @room_tenant_link.room_id, start_date: @room_tenant_link.start_date, tenant_id: @room_tenant_link.tenant_id }
    end

    assert_redirected_to room_tenant_link_path(assigns(:room_tenant_link))
  end

  test "should show room_tenant_link" do
    get :show, id: @room_tenant_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @room_tenant_link
    assert_response :success
  end

  test "should update room_tenant_link" do
    patch :update, id: @room_tenant_link, room_tenant_link: { end_date: @room_tenant_link.end_date, room_id: @room_tenant_link.room_id, start_date: @room_tenant_link.start_date, tenant_id: @room_tenant_link.tenant_id }
    assert_redirected_to room_tenant_link_path(assigns(:room_tenant_link))
  end

  test "should destroy room_tenant_link" do
    assert_difference('RoomTenantLink.count', -1) do
      delete :destroy, id: @room_tenant_link
    end

    assert_redirected_to room_tenant_links_path
  end
end
