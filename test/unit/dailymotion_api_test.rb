require 'test_helper'

class DailymotionApiTest < ActiveSupport::TestCase
  
  test "get_token" do
    assert DailymotionApi.get_token == Dailymotion.first.refresh_token
  end

  test "videos" do
    puts "videos: " + DailymotionApi.videos
  end
end
