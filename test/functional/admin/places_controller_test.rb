require 'test_helper'

class Admin::PlacesControllerTest < ActionController::TestCase
  setup do
    @place = create :place
    @member = create :member
    @member.user.role = "admin"
    @member.user.save
    user_sign_in @member
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new place" do
    get :new
    assert_response :success
  end

  test "should create place" do
    attributes = attributes_for :place
    post :create, place: attributes
    assert_response :redirect

    @place = Place.last
    assert_equal attributes[:title], @place.title
  end

  test "should get edit place" do
    get :edit, id: @place
    assert_response :success
  end

  test "should update place" do
    attributes = attributes_for :place
    put :update, id: @place, place: attributes
    assert_response :redirect

    @place.reload
    assert_equal attributes[:title], @place.title
  end

  test "should destroy place" do
    assert_difference('Place.count', -1) do
      delete :destroy, id: @place
    end

    assert_redirected_to admin_places_path
  end

  test "should not create place with render new" do
    attributes = attributes_for :place
    attributes[:title] = nil

    post :create, place: attributes
    assert_template :new
  end

  test "should not update place with render edit" do
    attributes = attributes_for :place
    attributes[:title] = nil
    put :update, id: @place, place: attributes
    assert_template :edit
  end
end
