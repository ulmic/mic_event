require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = create :event
    @member = create :member
    @member.user.accept
    @place = create :place
  end

  test "should get index" do
    user_sign_in @member.user
    get :index
    assert_response :success
  end

  test "should show event" do
    user_sign_in @member.user
    get :show, id: @event
    assert_response :success
  end

  include EventsHelper

  test "should be current member checkined on current event" do
    checkin = create :checkin
    user_sign_in checkin.member
    assert_equal checkin, current_user_checkined?(checkin.event)
  end
end
