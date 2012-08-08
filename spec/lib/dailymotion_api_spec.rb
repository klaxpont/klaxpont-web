require 'spec_helper'
require 'dailymotion_api'

describe DailymotionApi do

  it "can retrieve an access token" do
    # TODO: method now returns parsed response instead of raw one
    # should handle in method Timeout Error or 500 error
    response = VCR.use_cassette('dailymotion_token_request') do
       DailymotionApi.get_token
    end
    refresh_token = response["refresh_token"]
    refresh_token.should_not be_empty

    # TODO: method now returns parsed response instead of raw one
    # should handle in method Timeout Error or 500 error
    response = VCR.use_cassette('dailymotion_token_refresh') do
       DailymotionApi.get_token(refresh_token)
    end
    refresh_token.should == response["refresh_token"]


  end

  pending "can retrieve videos" do

  end

  pending "can create a video object from hash" do

  end
end