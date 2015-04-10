require 'test_helper'

class CreationsControllerTest < ActionController::TestCase
  setup do
    @creation = creations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:creations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create creation" do
    assert_difference('Creation.count') do
      post :create, creation: {  }
    end

    assert_redirected_to creation_path(assigns(:creation))
  end

  test "should show creation" do
    get :show, id: @creation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @creation
    assert_response :success
  end

  test "should update creation" do
    patch :update, id: @creation, creation: {  }
    assert_redirected_to creation_path(assigns(:creation))
  end

  test "should destroy creation" do
    assert_difference('Creation.count', -1) do
      delete :destroy, id: @creation
    end

    assert_redirected_to creations_path
  end
end
