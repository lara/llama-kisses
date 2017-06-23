require 'test_helper'

class PurchasesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get purchases_home_url
    assert_response :success
  end

  test "should get create" do
    get purchases_create_url
    assert_response :success
  end

end
