require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get you_are_busted" do
    get :you_are_busted
    assert_response :success, @response.body
  end
  test "should get privacy" do
    get :privacy
    assert_response :success, @response.body
  end
end
