require 'test_helper'

class DailymotionApiTest < ActiveSupport::TestCase
  
  test "get_token" do
    Dailymotion.delete_all

    refresh_token = Dailymotion.get_refresh_token
    assert refresh_token == nil

    response = DailymotionApi.get_token(refresh_token)
    puts "body: #{response.body}"

    refresh_token = response["refresh_token"]
    Dailymotion.save_refresh_token refresh_token

    assert Dailymotion.get_refresh_token == refresh_token

    response = DailymotionApi.get_token(refresh_token)
    puts "body: #{response.body}"

    assert response["refresh_token"] == refresh_token
  end


  test "videos" do
    #puts "videos: " + DailymotionApi.videos
  end
end
