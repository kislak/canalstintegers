require 'test_helper'

class CsIntegersControllerTest < ActionController::TestCase
  setup do
    @cs_integer = cs_integers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  test "should create cs_integer" do
    # assert_difference('CsInteger.count') do
    #   post :create, cs_integer: { celebrity_name: @cs_integer.celebrity_name, celebrity_screen_name: @cs_integer.celebrity_screen_name, origin: @cs_integer.origin, origin_url: @cs_integer.origin_url }
    # end
    post :create
    assert_redirected_to cs_integer_path(assigns(:cs_integer))
  end

  test "should show cs_integer" do
    get :show, id: @cs_integer
    assert_response :success
  end

end
