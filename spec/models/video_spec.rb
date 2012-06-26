require 'spec_helper'

describe Video do
  it "should be invalid without video_id" do
    video = Video.new :video_id => nil
    video.should be_invalid
  end

end
