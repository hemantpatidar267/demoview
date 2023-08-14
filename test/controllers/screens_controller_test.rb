require "test_helper"

class ScreensControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get screens_new_url
    assert_response :success
  end

  test "should get create" do
    get screens_create_url
    assert_response :success
  end

  test "should get show" do
    get screens_show_url
    assert_response :success
  end

  test "should get edit" do
    get screens_edit_url
    assert_response :success
  end

  test "should get update" do
    get screens_update_url
    assert_response :success
  end

  test "should get destroy" do
    get screens_destroy_url
    assert_response :success
  end
end
