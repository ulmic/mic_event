require 'test_helper'

class Admin::EventsControllerTest < ActionController::TestCase
  setup do
    # Creates a reference to the admin controller
    @controller = ::Admin::EventsController.new 

    # Prevents checking for a valid user session (pretends we're logged in)
    @controller.stubs(:authenticate_active_admin_user)
  end

  test "should get index" do 
    get :index
    assert_response :success
  end

  test "should get new" do 
    get :new
    assert_response :success
  end
end
