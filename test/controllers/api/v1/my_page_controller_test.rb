require "test_helper"

class Api::V1::MyPageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_my_page_show_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_my_page_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_my_page_update_url
    assert_response :success
  end
end
