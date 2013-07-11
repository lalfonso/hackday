require 'test_helper'

class OverlaysControllerTest < ActionController::TestCase
  setup do
    @overlay = overlays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:overlays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create overlay" do
    assert_difference('Overlay.count') do
      post :create, overlay: { date_from: @overlay.date_from, date_to: @overlay.date_to, image: @overlay.image, position: @overlay.position }
    end

    assert_redirected_to overlay_path(assigns(:overlay))
  end

  test "should show overlay" do
    get :show, id: @overlay
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @overlay
    assert_response :success
  end

  test "should update overlay" do
    put :update, id: @overlay, overlay: { date_from: @overlay.date_from, date_to: @overlay.date_to, image: @overlay.image, position: @overlay.position }
    assert_redirected_to overlay_path(assigns(:overlay))
  end

  test "should destroy overlay" do
    assert_difference('Overlay.count', -1) do
      delete :destroy, id: @overlay
    end

    assert_redirected_to overlays_path
  end
end
