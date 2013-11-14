require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = create :event
    @member = create :member
    @member.accept
    @place = create :place
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new event" do
    user_sign_in @member

    get :new
    assert_response :success
  end

  test "should create event" do
    user_sign_in @member

    attributes = attributes_for :event
    attributes[:member_id] = @member.id
    attributes[:place_id] = @place.id
    post :create, event: attributes
    assert_response :redirect

    @event = Event.last
    assert_equal attributes[:title], @event.title
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit event" do
    user_sign_in @member

    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    user_sign_in @member

    attributes = attributes_for :event
    put :update, id: @event, event: attributes
    assert_response :redirect

    @event.reload
    assert_equal attributes[:title], @event.title
  end

  test "should destroy event" do
    user_sign_in @member

    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end

  test "should not create event with render new" do
    user_sign_in @member
    attributes = attributes_for :event
    attributes[:title] = nil

    post :create, event: attributes
    assert_template :new
  end

  test "should not update event with render edit" do
    user_sign_in @member

    attributes = attributes_for :event
    attributes[:title] = nil
    put :update, id: @event, event: attributes
    assert_template :edit
  end

  include EventsHelper

  test "should be current member checkined on current event" do
    checkin = create :checkin
    user_sign_in checkin.member
    assert_equal checkin, current_user_checkined?(checkin.event)
  end
end
