require 'test_helper'

class MapExtractControllerTest < ActionController::TestCase
  test "should get extract" do
    get :extract
    assert_response :success
  end

end
