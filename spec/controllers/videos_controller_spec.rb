require 'spec_helper'

describe VideosController do

  describe "POST create" do
    pending "should return a message if record saved" do
      post "create",  :video_id => 'string', :user_id => 123, :latitude => 48.0, :longitude => 59.3, :format => :json
      video = Video.find :first
      video.video_id.should eq('string')
      video.user_id.should eq("123")
      video.latitude.should eq(48.0)
      video.longitude.should eq(59.3)
    end

    pending "shoud display error messages" do
      post "create", :format => :json
      puts response.body.inspect
      response.body.should include("errors")
    end

  end
end
