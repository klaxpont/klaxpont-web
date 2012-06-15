require 'spec_helper'
require 'dailymotion_api'

describe DailymotionApi do

  it "can retrieve an access token", :broken => true do
    response = DailymotionApi.get_token
   	
		# method now returns parsed response instead of raw one
    response.code.should == 200
	
    refresh_token = response["refresh_token"]
    refresh_token.should_not be_empty

    response = DailymotionApi.get_token(refresh_token)
   	# method now returns parsed response instead of raw one
		response.code.should == 200
	

    refresh_token.should == response["refresh_token"]
  end

  pending "can retrieve videos" do
  	
  end
  
  pending "can create a video object from hash" do
  	
  end
end