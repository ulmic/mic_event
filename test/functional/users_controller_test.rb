require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new user" do
    get :new
    assert_response :success
  end

  test "should create user" do
    user_sign_in @user

    attributes = attributes_for :user
    post :create, user: attributes
    assert_response :redirect

    @user = User.last
    assert_equal attributes[:email], @user.email
  end

  test "should show user" do
    user_sign_in @user

    get :show, id: @user
    assert_response :success
  end

  test "should get edit user" do
    user_sign_in @user

    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    user_sign_in @user

    attributes = attributes_for :user
    put :update, id: @user, user: attributes
    assert_response :redirect

    @user.reload
    assert_equal attributes[:email], @user.email
  end

  test "should destroy user" do
    user_sign_in @user

    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end

  test "should not create user with render new" do
    user_sign_in @user

    attributes = attributes_for :user
    post :create, user: attributes
    assert_response :redirect
  end

  test "should not update user with render edit" do
    attributes = attributes_for :user
    attributes[:title] = nil
    put :update, id: @user, user: attributes
    assert_response :redirect
  end
end
