require 'test_helper'

class CrimesControllerTest < ActionController::TestCase
  setup do
    @crime = crimes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crimes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crime" do
    assert_difference('Crime.count') do
      post :create, crime: { comment: @crime.comment, image_url: @crime.image_url, lat: @crime.lat, level: @crime.level, lon: @crime.lon }
    end

    assert_redirected_to crime_path(assigns(:crime))
  end

  test "should show crime" do
    get :show, id: @crime
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crime
    assert_response :success
  end

  test "should update crime" do
    put :update, id: @crime, crime: { comment: @crime.comment, image_url: @crime.image_url, lat: @crime.lat, level: @crime.level, lon: @crime.lon }
    assert_redirected_to crime_path(assigns(:crime))
  end

  test "should destroy crime" do
    assert_difference('Crime.count', -1) do
      delete :destroy, id: @crime
    end

    assert_redirected_to crimes_path
  end
end
