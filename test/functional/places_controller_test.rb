require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  setup do
    @place = create :place
    @member = create :member
    @member.user.accept
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should show place" do
    #cover people method in place decorator
    event = create :event
    event.place = @place
    @place.events.push event
    checkin = create :checkin
    checkin.event = event
    event.checkins.push checkin

    get :show, id: @place
    assert_response :success
  end

  test "should show place with event_date at different days" do
    event = create :event
    event.place = @place
    event.begin_datetime = event.end_datetime + 1.day
    @place.events.push event

    get :show, id: @place
    assert_response :success
  end
end
