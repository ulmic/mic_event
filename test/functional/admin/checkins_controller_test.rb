require 'test_helper'

class Admin::CheckinsControllerTest < ActionController::TestCase
  setup do
    @checkin = create :checkin
    @user = create :admin
    @user.member = create :member
    @user.save
    user_sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success, @response.body
  end

  test "should post create" do
    attributes = attributes_for :checkin
    post :create, checkin: attributes
    assert_response :redirect, @response.body
    assert_redirected_to admin_checkins_path
    checkin = Checkin.last
    assert_equal attributes[:description], checkin.description
  end

  test "should not post create" do
    attributes = attributes_for :checkin
    attributes[:status] = nil
    post :create, checkin: attributes
    assert_response :redirect, @response.body
    assert_redirected_to admin_checkins_path
    checkin = Checkin.last
    assert_not_equal attributes[:description], checkin.description
  end

  test "should get edit" do
    get :edit, id: @checkin
    assert_response :success, @response.body
  end

  test "should get new" do
    get :new
    assert_response :success, @response.body
  end

  test "should put update" do
    attributes = attributes_for :checkin
    put :update, checkin: attributes, id: @checkin
    assert_response :redirect, @response.body
    assert_redirected_to edit_admin_checkin_path @checkin
    @checkin.reload
    assert_equal attributes[:description], @checkin.description
  end

  test "should not put update" do
    attributes = attributes_for :checkin
    attributes[:status] = nil
    put :update, checkin: attributes, id: @checkin
    assert_response :redirect, @response.body
    assert_redirected_to edit_admin_checkin_path @checkin
    @checkin.reload
    assert_not_equal attributes[:description], @checkin.description
  end
  test "should delete destroy" do
    count = Checkin.count
    delete :destroy, id: @checkin
    assert_redirected_to admin_checkins_path
    assert_equal count - 1, Checkin.count
  end
end
