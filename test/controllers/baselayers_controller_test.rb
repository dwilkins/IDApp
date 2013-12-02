require 'test_helper'

class BaselayersControllerTest < ActionController::TestCase
  setup do
    @baselayer = baselayers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:baselayers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create baselayer" do
    assert_difference('Baselayer.count') do
      post :create, baselayer: { description: @baselayer.description, domain: @baselayer.domain, height: @baselayer.height, image: @baselayer.image, name: @baselayer.name, tilesize: @baselayer.tilesize, width: @baselayer.width, zoomlevels: @baselayer.zoomlevels }
    end

    assert_redirected_to baselayer_path(assigns(:baselayer))
  end

  test "should show baselayer" do
    get :show, id: @baselayer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @baselayer
    assert_response :success
  end

  test "should update baselayer" do
    patch :update, id: @baselayer, baselayer: { description: @baselayer.description, domain: @baselayer.domain, height: @baselayer.height, image: @baselayer.image, name: @baselayer.name, tilesize: @baselayer.tilesize, width: @baselayer.width, zoomlevels: @baselayer.zoomlevels }
    assert_redirected_to baselayer_path(assigns(:baselayer))
  end

  test "should destroy baselayer" do
    assert_difference('Baselayer.count', -1) do
      delete :destroy, id: @baselayer
    end

    assert_redirected_to baselayers_path
  end
end
