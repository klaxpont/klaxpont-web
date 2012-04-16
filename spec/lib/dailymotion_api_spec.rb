require 'spec_helper'
require 'dailymotion_api'

describe DailymotionApi do

  it "can retrieve an access token" do
    response = DailymotionApi.get_token
    response.code.should == 200
    
    refresh_token = response["refresh_token"]
    refresh_token.should_not be_empty

    response = DailymotionApi.get_token(refresh_token)
    response.code.should == 200

    refresh_token.should == response["refresh_token"]
  end

end