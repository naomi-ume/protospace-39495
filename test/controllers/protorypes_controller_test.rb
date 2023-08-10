require "test_helper"

class ProtorypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get protorypes_index_url
    assert_response :success
  end
end
