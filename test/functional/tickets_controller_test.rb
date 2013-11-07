require 'test_helper'

class TicketsControllerTest < ActionController::TestCase
  setup do
    @member = create :member
  end

  test "should show member" do
    get :show, number: @member
    assert_response :success
  end
end
