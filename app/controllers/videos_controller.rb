class VideosController < ApplicationController
  

  def create
    # Get the video_id and the user_id
    # Associate them.
    @video = Video.new :video_id => params[:video_id], :user_id => params[:user_id]
    @video.latitude = params[:latitude]
    @video.longitude = params[:longitude]
    if @video.save
      render :action => 'show'
    else
      @errors = @video.errors
      render :partial => 'shared/errors'
    end
  end

  def index
    @videos = Video.all
  end
end
