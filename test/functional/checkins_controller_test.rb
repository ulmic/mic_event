require 'test_helper'

class CheckinsControllerTest < ActionController::TestCase
  setup do
    @checkin = create :checkin
    @member = create :member
    @member.user.accept
    @event = create :event
  end

  test "should get index" do
    get :index, id: @event
    assert_response :success
  end

  test "should get new checkin" do
    user_sign_in @member

    get :new, id: @event
    assert_response :success
  end

  test "should not get new checkin because already has an checkin" do
    user_sign_in @member
    checkin = create :checkin
    checkin.member = @member
    @member.checkins.push checkin
    checkin.event = @event
    @event.checkins.push checkin

    get :new, id: @event
    assert_redirected_to event_path @event
  end

  test "should create checkin" do
    user_sign_in @member
    attributes = attributes_for :checkin
    attributes[:member_id] = @member.id
    post :create, id: @event, checkin: attributes
    assert_response :redirect

    @checkin = Checkin.last
    assert_equal attributes[:description], @checkin.description
  end

  test "should not create checkin with new user" do
    user_sign_in @member
    @member.user.confirm_state = :new
    @member.user.save
    attributes = attributes_for :checkin
    attributes[:member_id] = @member.id
    post :create, id: @event, checkin: attributes
    assert_response :redirect
    assert_redirected_to root_path
  end

  test "should get edit checkin" do
    user_sign_in @member

    get :edit, id: @checkin
    assert_response :success
  end

  test "should update checkin" do
    user_sign_in @member

    attributes = attributes_for :checkin
    put :update, id: @checkin, checkin: attributes
    assert_response :redirect

    @checkin.reload
    assert_equal attributes[:description], @checkin.description
  end

  test "should destroy checkin" do
    user_sign_in @member
    event = @checkin.event

    assert_difference('Checkin.count', -1) do
      delete :destroy, id: @checkin
    end

    assert_redirected_to event_path(event)
  end

  test "should not create checkin with render new" do
    user_sign_in @member

    attributes = attributes_for :checkin
    attributes[:status] = nil
    post :create, id: @event, checkin: attributes
    assert_response :success
  end

  test "should not update checkin with render edit" do
    user_sign_in @member
    attributes = attributes_for :checkin
    attributes[:member_id] = nil
    put :update, id: @checkin, checkin: attributes
    assert_response :success
  end
end
