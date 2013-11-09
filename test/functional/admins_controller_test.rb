require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
    @member = create :member
  end

  test "should get index" do
    member_sign_in @admin

    get :index, id: @member
    assert_response :success
  end

  test "should get new admin" do
    member_sign_in @admin
    get :new, id: @member
    assert_response :success
  end

  test "should create admin" do
    member_sign_in @admin

    attributes = attributes_for :admin
    post :create, id: @member, admin: attributes
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

    member = @admin.member
    assert_difference('Admin.count', -1) do
      delete :destroy, id: @admin
    end

    assert_redirected_to ticket_path(member)
  end
end
