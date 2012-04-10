class VideoController < ApplicationController
  
  respond_to :json

  def create
    # Get the video_id and the user_id
    # Associate them.
    @video = Video.new :video_id => params[:video_id], :user_id => params[:user_id]

    if @video.save
      render :json => @video, :status => :created #, :location => @video
    else
      respond_with @video.errors, :status => :unprocessable_entity
    end
  end

end
