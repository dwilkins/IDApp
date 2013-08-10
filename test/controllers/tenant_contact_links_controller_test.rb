require 'test_helper'

class TenantContactLinksControllerTest < ActionController::TestCase
  setup do
    @tenant_contact_link = tenant_contact_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tenant_contact_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tenant_contact_link" do
    assert_difference('TenantContactLink.count') do
      post :create, tenant_contact_link: { contact_id: @tenant_contact_link.contact_id, end_date: @tenant_contact_link.end_date, start_date: @tenant_contact_link.start_date, tenant_id: @tenant_contact_link.tenant_id }
    end

    assert_redirected_to tenant_contact_link_path(assigns(:tenant_contact_link))
  end

  test "should show tenant_contact_link" do
    get :show, id: @tenant_contact_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tenant_contact_link
    assert_response :success
  end

  test "should update tenant_contact_link" do
    patch :update, id: @tenant_contact_link, tenant_contact_link: { contact_id: @tenant_contact_link.contact_id, end_date: @tenant_contact_link.end_date, start_date: @tenant_contact_link.start_date, tenant_id: @tenant_contact_link.tenant_id }
    assert_redirected_to tenant_contact_link_path(assigns(:tenant_contact_link))
  end

  test "should destroy tenant_contact_link" do
    assert_difference('TenantContactLink.count', -1) do
      delete :destroy, id: @tenant_contact_link
    end

    assert_redirected_to tenant_contact_links_path
  end
end
