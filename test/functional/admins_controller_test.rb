require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
    @user = create :user
  end

  test "should get index" do
    user_sign_in @admin

    get :index, id: @user
    assert_response :success
  end

  test "should get new admin" do
    user_sign_in @admin
    get :new, id: @user
    assert_response :success
  end

  test "should create admin" do
    user_sign_in @admin

    attributes = attributes_for :admin
    attributes[:user_id] = @user.id
    post :create, id: @user, admin: attributes
    assert_response :redirect

    @admin = Admin.last
    assert_equal attributes[:user_id], @admin.user_id
  end

  test "should get edit admin" do
    user_sign_in @admin

    get :edit, id: @admin
    assert_response :success
  end

  test "should update admin" do
    user_sign_in @admin

    attributes = attributes_for :admin
    attributes[:user_id] = @user.id
    put :update, id: @admin, admin: attributes
    assert_response :redirect

    @admin.reload
    assert_equal attributes[:user_id], @admin.user_id
  end

  test "should destroy admin" do
    user_sign_in @admin

    assert_difference('Admin.count', -1) do
      delete :destroy, id: @admin
    end

    assert_redirected_to admins_path
  end
end
