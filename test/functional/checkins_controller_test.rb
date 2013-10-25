require 'test_helper'

class CheckinsControllerTest < ActionController::TestCase
  setup do
    @checkin = create :checkin
    @member = create :member
    @event = create :event
  end

  test "should get index" do
    get :index, id: @event
    assert_response :success
  end

  test "should get new checkin" do
    member_sign_in @member

    get :new, id: @event
    assert_response :success
  end

  test "should create checkin" do
    member_sign_in @member

    attributes = attributes_for :checkin
    attributes[:member_id] = @member.id
    post :create, id: @event, checkin: attributes
    assert_response :redirect

    @checkin = Checkin.last
    assert_equal attributes[:description], @checkin.description
  end

  test "should show checkin" do
    member_sign_in @member

    get :show, id: @checkin
    assert_response :success
  end

  test "should get edit checkin" do
    member_sign_in @member

    get :edit, id: @checkin
    assert_response :success
  end

  test "should update checkin" do
    member_sign_in @member

    attributes = attributes_for :checkin
    put :update, id: @checkin, checkin: attributes
    assert_response :redirect

    @checkin.reload
    assert_equal attributes[:description], @checkin.description
  end

  test "should destroy checkin" do
    member_sign_in @member

    assert_difference('Checkin.count', -1) do
      delete :destroy, id: @checkin
    end

    assert_redirected_to checkins_path
  end

  test "should not create checkin with render new" do
    member_sign_in @member

    attributes = attributes_for :checkin
    attributes[:status] = nil
    post :create, id: @event, checkin: attributes
    assert_response :success
  end

  test "should not update checkin with render edit" do
    member_sign_in @member
    attributes = attributes_for :checkin
    attributes[:member_id] = nil
    put :update, id: @checkin, checkin: attributes
    assert_response :success
  end
end
