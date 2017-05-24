require 'test_helper'

class CalculatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get calculates_index_url
    assert_response :success
  end

end
