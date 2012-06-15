class VideosController < ApplicationController
  

  def create
    # Get the video_id and the user_id
    # Associate them.
    @video = Video.new :video_id => params[:video_id], :user_id => params[:user_id]
    @video.latitude = params[:latitude]
    @video.longitude = params[:longitude]
    if @video.save
      render :json => @video, :status => :created #, :location => @video
    else
      respond_with @video.errors, :status => :unprocessable_entity
    end
  end

  def index
    @videos = Video.all
  end
end
