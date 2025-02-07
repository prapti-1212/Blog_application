require "test_helper"

class Api::V1::BlogControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_blog_show_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_blog_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_blog_update_url
    assert_response :success
  end
end
