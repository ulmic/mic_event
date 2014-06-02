require 'test_helper'

class Admin::WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    create :event
    user = create :admin
    user_sign_in user
    get :index
    assert_response :success, @response.body
  end
end
