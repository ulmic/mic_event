require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
    @member = create :member
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new admin" do
    member_sign_in @admin
    get :new
    assert_response :success
  end

  test "should create admin" do
    member_sign_in @admin

    attributes = attributes_for :admin
    post :create, admin: attributes
    assert_response :redirect

    @admin = Admin.last
    assert_equal attributes[:member_id], @admin.member_id
  end

  test "should get edit admin" do
    member_sign_in @admin

    get :edit, id: @admin
    assert_response :success
  end

  test "should update admin" do
    member_sign_in @admin

    attributes = attributes_for :admin
    put :update, id: @admin, admin: attributes
    assert_response :redirect

    @admin.reload
    assert_equal attributes[:member_id], @admin.member_id
  end

  test "should destroy admin" do
    member_sign_in @admin

    assert_difference('Admin.count', -1) do
      delete :destroy, id: @admin
    end

    assert_redirected_to admins_path
  end

  test "should not create admin with render new" do
    member_sign_in @admin
    attributes = attributes_for :admin
    attributes[:member_id] = nil

    post :create, admin: attributes
    assert_template :new
  end

  test "should not update admin with render edit" do
    member_sign_in @admin

    attributes = attributes_for :admin
    attributes[:member_id] = nil
    put :update, id: @admin, admin: attributes
    assert_template :edit
  end
end
