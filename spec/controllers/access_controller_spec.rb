require 'spec_helper'

describe AccessController do

  describe "Get token" do
    it "should return json response with valid token" do
      VCR.use_cassette('dailymotion_wrapper_get_token') do
        get 'get_token', :format => :json
        response.body.should include('access_token')
      end
    end

    pending "shoud display error messages" do
      post "create", :format => :json
      puts response.body.inspect
      response.body.should include("errors")
    end

  end
end
