require 'spec_helper'

describe VideosController do


  describe "POST create" do
    it "should return record if record saved" do
      post "create", :video_id => 'string', :user_id => 123, :latitude => 48.0, :longitude => 59.3, :format => :json

      response.body.to_json.should include('id')
      response.header['Content-Type'].should include 'application/json'

      video = Video.find :first
      video.video_id.should eq('string')
      video.user_id.should eq("123")
      video.to_coordinates.should eq([48.0,59.3])# [lat, lon]
      video.id.should_not be_nil

      # curl -X 'POST' http://klaxpont-web.dev/api/videos -d "video_id=xfv&user_id=1&latitude=14.0&longitude=45.4"
    end

    it "shoud display error messages" do
      post "create", :format => :json

      parsed_body = JSON.parse(response.body)
      parsed_body.should include("error")
    end

  end
end
