require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  setup do
    @member = create :member
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new member" do
    get :new
    assert_response :success
  end

  test "should create member" do
    member_sign_in @member

    attributes = attributes_for :member
    post :create, member: attributes
    assert_response :redirect

    @member = Member.last
    assert_equal attributes[:first_name], @member.first_name
  end

  test "should show member" do
    get :show, number: @member
    assert_response :success
  end

  test "should get edit member" do
    member_sign_in @member

    get :edit, id: @member
    assert_response :success
  end

  test "should not get edit member with not access" do
    member_sign_out

    get :edit, id: @member
    assert_redirected_to '/404'
  end

  test "should update member" do
    member_sign_in @member

    attributes = attributes_for :member
    put :update, id: @member, member: attributes
    assert_response :redirect

    @member.reload
    assert_equal attributes[:first_name], @member.first_name
  end

  test "should destroy member" do
    member_sign_in @member

    assert_difference('Member.count', -1) do
      delete :destroy, id: @member
    end

    assert_redirected_to members_path
  end

  test "should not create member with render new" do
    member_sign_in @member

    attributes = attributes_for :member
    attributes[:first_name] = nil
    post :create, member: attributes
    assert_response :success
  end

  test "should not update member with render edit" do
    member_sign_in @member
    attributes = attributes_for :member
    attributes[:first_name] = nil
    put :update, id: @member, member: attributes
    assert_response :success
  end
end
