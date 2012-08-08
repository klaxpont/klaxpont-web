require 'spec_helper'
require 'dailymotion_wrapper'

describe DailymotionWrapper do

  it "can retrieve an access token" do
    VCR.use_cassette('dailymotion_wrapper_get_token') do

      token = DailymotionWrapper.get_access_token
      token.should_not be_nil
      token.should_not be_empty

      # Remove from Redis then retest.
      token = DailymotionWrapper.get_access_token
      token.should_not be_nil
      token.should_not be_empty

    end
  end

  pending "check with and without refresh_token" do
  end

  pending "check after expiration" do
  end

end