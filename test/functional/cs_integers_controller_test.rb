require 'test_helper'

class CsIntegersControllerTest < ActionController::TestCase
  setup do
    @cs_integer = cs_integers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cs_integers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cs_integer" do
    assert_difference('CsInteger.count') do
      post :create, cs_integer: { celebrity_name: @cs_integer.celebrity_name, celebrity_screen_name: @cs_integer.celebrity_screen_name, origin: @cs_integer.origin, origin_url: @cs_integer.origin_url }
    end

    assert_redirected_to cs_integer_path(assigns(:cs_integer))
  end

  test "should show cs_integer" do
    get :show, id: @cs_integer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cs_integer
    assert_response :success
  end

  test "should update cs_integer" do
    put :update, id: @cs_integer, cs_integer: { celebrity_name: @cs_integer.celebrity_name, celebrity_screen_name: @cs_integer.celebrity_screen_name, origin: @cs_integer.origin, origin_url: @cs_integer.origin_url }
    assert_redirected_to cs_integer_path(assigns(:cs_integer))
  end

  test "should destroy cs_integer" do
    assert_difference('CsInteger.count', -1) do
      delete :destroy, id: @cs_integer
    end

    assert_redirected_to cs_integers_path
  end
end
