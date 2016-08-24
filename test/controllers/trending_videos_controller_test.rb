require 'test_helper'

class TrendingVideosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trending_videos_index_url
    assert_response :success
  end

end
