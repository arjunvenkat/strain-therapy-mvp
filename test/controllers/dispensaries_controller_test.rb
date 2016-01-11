require 'test_helper'

class DispensariesControllerTest < ActionController::TestCase
  setup do
    @dispensary = dispensaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dispensaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dispensary" do
    assert_difference('Dispensary.count') do
      post :create, dispensary: { description: @dispensary.description, name: @dispensary.name }
    end

    assert_redirected_to dispensary_path(assigns(:dispensary))
  end

  test "should show dispensary" do
    get :show, id: @dispensary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dispensary
    assert_response :success
  end

  test "should update dispensary" do
    patch :update, id: @dispensary, dispensary: { description: @dispensary.description, name: @dispensary.name }
    assert_redirected_to dispensary_path(assigns(:dispensary))
  end

  test "should destroy dispensary" do
    assert_difference('Dispensary.count', -1) do
      delete :destroy, id: @dispensary
    end

    assert_redirected_to dispensaries_path
  end
end
