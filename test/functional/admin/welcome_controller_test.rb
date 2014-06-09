require 'test_helper'

class Admin::WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    create :event
    user = create :admin
    user.member = create :member
    user.save
    user_sign_in user
    get :index
    assert_response :success, @response.body
  end
  test "should not get index with signed_out admin" do
    get :index
    assert_response :redirect
    assert_redirected_to new_session_path
  end
  test "shoulg not get index with signed_in not admin" do
    user = create :user
    user_sign_in user
    get :index
    assert_response :redirect
    assert_redirected_to not_found_errors_path
  end
end
