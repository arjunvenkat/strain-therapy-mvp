require 'test_helper'

class UserAilmentsControllerTest < ActionController::TestCase
  setup do
    @user_ailment = user_ailments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_ailments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_ailment" do
    assert_difference('UserAilment.count') do
      post :create, user_ailment: { ailment_id: @user_ailment.ailment_id, user_id: @user_ailment.user_id }
    end

    assert_redirected_to user_ailment_path(assigns(:user_ailment))
  end

  test "should show user_ailment" do
    get :show, id: @user_ailment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_ailment
    assert_response :success
  end

  test "should update user_ailment" do
    patch :update, id: @user_ailment, user_ailment: { ailment_id: @user_ailment.ailment_id, user_id: @user_ailment.user_id }
    assert_redirected_to user_ailment_path(assigns(:user_ailment))
  end

  test "should destroy user_ailment" do
    assert_difference('UserAilment.count', -1) do
      delete :destroy, id: @user_ailment
    end

    assert_redirected_to user_ailments_path
  end
end
