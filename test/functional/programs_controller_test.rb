require 'test_helper'

class ProgramsControllerTest < ActionController::TestCase
  setup do
    @program = create :program
    @admin = create :admin
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new program" do
    user_sign_in @admin

    get :new
    assert_response :success
  end

  test "should create program" do
    user_sign_in @admin

    attributes = attributes_for :program
    post :create, program: attributes
    assert_response :redirect

    @program = Program.last
    assert_equal attributes[:name], @program.name
  end

  test "should show program" do
    get :show, id: @program
    assert_response :success
  end

  test "should get edit program" do
    user_sign_in @admin

    get :edit, id: @program
    assert_response :success
  end

  test "should update program" do
    user_sign_in @admin

    attributes = attributes_for :program
    put :update, id: @program, program: attributes
    assert_response :redirect

    @program.reload
    assert_equal attributes[:name], @program.name
  end

  test "should destroy program" do
    user_sign_in @admin

    assert_difference('Program.count', -1) do
      delete :destroy, id: @program
    end

    assert_redirected_to programs_path
  end

  test "should not create program with render new" do
    user_sign_in @admin
    attributes = attributes_for :program
    attributes[:name] = nil

    post :create, program: attributes
    assert_template :new
  end

  test "should not update program with render edit" do
    user_sign_in @admin

    attributes = attributes_for :program
    attributes[:name] = nil
    put :update, id: @program, program: attributes
    assert_template :edit
  end
end
