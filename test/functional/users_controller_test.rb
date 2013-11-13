require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
  end

  test "should get new user" do
    get :new
    assert_response :success
  end

  test "should not get new user" do
    user_sign_in @user

    get :new
    assert_redirected_to root_path
  end

  test "should create user" do
    attributes = attributes_for :user
    post :create, user: attributes
    assert_response :redirect

    @user = User.last
    assert_equal attributes[:email], @user.email
  end

end
