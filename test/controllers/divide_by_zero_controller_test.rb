require 'test_helper'

class DivideByZeroControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get divide_by_zero_index_url
    assert_response :success
  end

end
