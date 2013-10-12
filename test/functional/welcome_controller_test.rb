require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get welcome" do
    get :index
    assert_response :success
  end
end
