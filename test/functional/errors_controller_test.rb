require 'test_helper'

class ErrorsControllerTest < ActionController::TestCase
  test "should get not_found" do
    get :not_found
    assert_response 404
  end
end
