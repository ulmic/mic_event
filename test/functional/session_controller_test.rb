require 'test_helper'

class SessionControllerTest < ActionController::TestCase
  def setup
    @member = create :member
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    member = create :member
    attrs = { email: "nat.mu@mail.ru", password: "123" }

    post :create, member: attrs
    assert_response :redirect

    assert member_signed_in?
  end

  test "should delete destroy" do
    member_sign_in @member
    assert member_signed_in?

    delete :destroy
    assert_response :redirect
  end
end
