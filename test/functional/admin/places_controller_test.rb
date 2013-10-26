require 'test_helper'

class Admin::PlacesControllerTest < ActionController::TestCase
  setup do
    @controller = ::Admin::PlacesController.new
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
