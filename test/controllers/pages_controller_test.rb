require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get Team" do
    get pages_Team_url
    assert_response :success
  end

  test "should get Contact" do
    get pages_Contact_url
    assert_response :success
  end

end
