require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @user.role = :admin
    @user.member = create :member
    @user.save
    user_sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success, @response.body
  end

  test "should post create" do
    attributes = attributes_for :user
    post :create, user: attributes
    assert_response :redirect, @response.body
    assert_redirected_to admin_users_path
    user = User.last
    assert_equal attributes[:email], user.email
  end

  test "should not post create" do
    attributes = attributes_for :user
    attributes[:password] = nil
    post :create, user: attributes
    assert_response :redirect, @response.body
    assert_redirected_to admin_users_path
    user = User.last
    assert_not_equal attributes[:email], user.email
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success, @response.body
  end

  test "should get new" do
    get :new
    assert_response :success, @response.body
  end

  test "should put update" do
    attributes = attributes_for :user
    put :update, user: attributes, id: @user
    assert_response :redirect, @response.body
    assert_redirected_to edit_admin_user_path @user
    @user.reload
    assert_equal attributes[:email], @user.email
  end

  test "should not put update" do
    attributes = attributes_for :user
    attributes[:email] = nil
    put :update, user: attributes, id: @user
    assert_response :redirect, @response.body
    assert_redirected_to edit_admin_user_path @user
    @user.reload
    assert_not_equal attributes[:password], @user.password
  end

  test "should put bust" do
    put :bust, id: @user
    assert_response :redirect, @response.body
    @user.reload
    assert @user.busted?
    assert_redirected_to admin_users_path
  end

  test "should put retrieve" do
    @user.bust
    put :retrieve, id: @user
    assert_response :redirect, @response.body
    @user.reload
    assert @user.accepted?
    assert_redirected_to admin_users_path
  end

  test "should put accept" do
    put :accept, id: @user
    assert_response :redirect, @response.body
    @user.reload
    assert @user.accepted?
    assert_redirected_to admin_users_path
  end
end
