require 'test_helper'

class Admin::PagesControllerTest < ActionController::TestCase
  setup do
    @page = create :page
    @admin = create :admin
    @admin.member = create :member
    @admin.save
    user_sign_in @admin
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new page" do
    user_sign_in @admin

    get :new
    assert_response :success
  end

  test "should create page" do
    user_sign_in @admin

    attributes = attributes_for :page
    post :create, page: attributes
    assert_response :redirect
    @page = Page.last
    assert_redirected_to edit_admin_page_path @page
    assert_equal attributes[:title], @page.title
  end

  test "should get edit page" do
    user_sign_in @admin

    get :edit, id: @page
    assert_response :success
  end

  test "should update page" do
    user_sign_in @admin

    attributes = attributes_for :page
    put :update, id: @page, page: attributes
    assert_response :redirect
    assert_redirected_to "#{edit_admin_page_path @page}?flash=success"

    @page.reload
    assert_equal attributes[:title], @page.title
  end

  test "should destroy page" do
    user_sign_in @admin

    assert_difference('Page.count', -1) do
      delete :destroy, id: @page
    end

    assert_redirected_to admin_pages_path
  end

  test "should not create page with render new" do
    user_sign_in @admin
    attributes = attributes_for :page
    attributes[:title] = nil

    post :create, page: attributes
    assert_template :new
  end

  test "should not update page with render edit" do
    user_sign_in @admin

    attributes = attributes_for :page
    attributes[:title] = nil
    put :update, id: @page, page: attributes
    assert_template :edit
  end
end
