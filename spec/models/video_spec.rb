require 'spec_helper'

describe Video do
  it "should be invalid without video_id" do
    video = Video.new :video_id => nil
    video.should have(1).error_on(:video_id)
  end

end
