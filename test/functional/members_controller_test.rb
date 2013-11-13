require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  setup do
    @member = create :member
    @user = create :user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @member
    assert_response :success
  end

  test "should get new member" do
    user_sign_in @user
    get :new, id: @user
    assert_response :success
  end

  test "should not get new and get new_user" do
    another_user = create :user
    user_sign_in another_user
    get :new, id: @user
    assert_redirected_to new_user_path
  end

  test "should not get new member" do
    get :new, id: @user
    assert_redirected_to root_path
  end

  test "should create member" do
    user_sign_in @user

    attributes = attributes_for :member
    attributes[:user_id] = @user.id
    post :create, member: attributes
    assert_response :redirect

    @member = Member.last
    assert_equal attributes[:first_name], @member.first_name
  end

  test "should get edit member" do
    user_sign_in @member

    get :edit, id: @member
    assert_response :success
  end

  test "should not get edit member with not access" do
    user_sign_out

    get :edit, id: @member
    assert_redirected_to not_found_errors_path
  end

  test "should update member" do
    user_sign_in @member

    attributes = attributes_for :member
    put :update, id: @member, member: attributes
    assert_response :redirect

    @member.reload
    assert_equal attributes[:first_name], @member.first_name
  end

  test "should destroy member" do
    user_sign_in @member

    assert_difference('Member.count', -1) do
      delete :destroy, id: @member
    end

    assert_redirected_to members_path
  end

  test "should not create member with render new" do
    user_sign_in @member

    attributes = attributes_for :member
    attributes[:first_name] = nil
    post :create, member: attributes
    assert_response :success
  end

  test "should not update member with render edit" do
    user_sign_in @member
    attributes = attributes_for :member
    attributes[:first_name] = nil
    put :update, id: @member, member: attributes
    assert_response :success
  end
end
