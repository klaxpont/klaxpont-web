require 'spec_helper'

describe AccessController do

  describe "Get token" do
    it "should return json response with valid token" do
      VCR.use_cassette('dailymotion_wrapper_get_token') do
        get 'get_token', :format => :json

        parsed_body = JSON.parse(response.body)
        parsed_body.should include('response')
        parsed_body['response'].should include('access_token')
         parsed_body['response']['access_token'].should_not be_empty
      end
    end

    pending "shoud display error messages" do
      post "create", :format => :json
      puts response.body.inspect
      response.body.should include("errors")
    end

  end
end
