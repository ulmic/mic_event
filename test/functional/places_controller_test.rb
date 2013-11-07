require 'test_controller_helper'

class PlacesControllerTest < ActionController::TestCase
  setup do
    @place = create :place
    @member = create :member
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new place" do
    member_sign_in @member

    get :new
    assert_response :success
  end

  test "should create place" do
    member_sign_in @member

    attributes = attributes_for :place
    post :create, place: attributes
    assert_response :redirect

    @place = Place.last
    assert_equal attributes[:title], @place.title
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
    event.begin_datetime = event.end_datetime - 1.day
    @place.events.push event

    get :show, id: @place
    assert_response :success
  end

  test "should get edit place" do
    member_sign_in @member

    get :edit, id: @place
    assert_response :success
  end

  test "should update place" do
    member_sign_in @member

    attributes = attributes_for :place
    put :update, id: @place, place: attributes
    assert_response :redirect

    @place.reload
    assert_equal attributes[:title], @place.title
  end

  test "should destroy place" do
    member_sign_in @member

    assert_difference('Place.count', -1) do
      delete :destroy, id: @place
    end

    assert_redirected_to places_path
  end

  test "should not create place with render new" do
    member_sign_in @member
    attributes = attributes_for :place
    attributes[:title] = nil

    post :create, place: attributes
    assert_template :new
  end

  test "should not update place with render edit" do
    member_sign_in @member

    attributes = attributes_for :place
    attributes[:title] = nil
    put :update, id: @place, place: attributes
    assert_template :edit
  end
end
