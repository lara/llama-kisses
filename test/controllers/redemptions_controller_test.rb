require 'test_helper'

class RedemptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get redemptions_new_url
    assert_response :success
  end

  test "should get create" do
    get redemptions_create_url
    assert_response :success
  end

end
