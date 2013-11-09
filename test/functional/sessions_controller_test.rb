require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def setup
    @member = create :member
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    attrs = { email: @member.email, password: @member.password }

    post :create, member: attrs
    assert_response :redirect

    assert member_signed_in?
  end

  test "should not post create" do
    attrs = { email: "kuku@mail.ru", password: "123" }

    post :create, member: attrs
    assert_response :success

    assert !member_signed_in?
  end

  test "should delete destroy" do
    member_sign_in @member
    assert member_signed_in?

    delete :destroy
    assert_response :redirect
  end
end
