require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  setup do
    @page = create :page
  end
  test "should get you_are_busted" do
    get :you_are_busted
    assert_response :success, @response.body
  end
  test "should get privacy" do
    get :privacy
    assert_response :success, @response.body
  end
  test "should get show" do
    get :show, slug: @page.slug
    assert_response :success, @response.body
  end
  test "should not show page" do
    @page.publish += 1.day
    @page.save
    get :show, slug: @page.slug
    assert_response :redirect, @response.body
    assert_redirected_to not_found_errors_path
  end
end
