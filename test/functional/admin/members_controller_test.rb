require 'test_helper'

class Admin::MembersControllerTest < ActionController::TestCase
  setup do
    @member = create :member
    @user = create :admin
    user_sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success, @response.body
  end

  test "should post create" do
    attributes = attributes_for :member
    post :create, member: attributes
    assert_response :redirect, @response.body
    assert_redirected_to admin_members_path
    member = Member.last
    assert_equal attributes[:first_name], member.first_name
  end

  test "should not post create" do
    attributes = attributes_for :member
    attributes[:first_name] = nil
    post :create, member: attributes
    assert_response :redirect, @response.body
    assert_redirected_to admin_members_path
    member = Member.last
    assert_not_equal attributes[:first_name], member.first_name
  end

  test "should get edit" do
    get :edit, id: @member
    assert_response :success, @response.body
  end

  test "should get new" do
    get :new
    assert_response :success, @response.body
  end

  test "should put update" do
    attributes = attributes_for :member
    put :update, member: attributes, id: @member
    assert_response :redirect, @response.body
    assert_redirected_to edit_admin_member_path @member
    @member.reload
    assert_equal attributes[:first_name], @member.first_name
  end

  test "should not put update" do
    attributes = attributes_for :member
    attributes[:first_name] = nil
    put :update, member: attributes, id: @member
    assert_response :redirect, @response.body
    assert_redirected_to edit_admin_member_path @member
    @member.reload
    assert_not_equal attributes[:first_name], @member.first_name
  end
end
