require 'test_controller_helper'

class WelcomeControllerTest < ActionController::TestCase
  setup do
    @program = create :program
    @checkin = create :checkin
    @event = create :event
    @event.checkins.push @checkin
    @event.program = @program
  end
  test "should get welcome" do
    get :index
    assert_response :success
  end
end
