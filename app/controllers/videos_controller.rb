class VideosController < ApplicationController
  

  def create
    # Get the video_id and the user_id
    # Associate them.
    @video = Video.find_or_initialize_by :video_id => params[:video_id], :user_id => params[:user_id]
    @video.latitude = params[:latitude]
    @video.longitude = params[:longitude]
    @video.state = :in_review
    if @video.save
      render :action => 'show'
    else
      @errors = @video.errors
      render :partial => 'shared/errors'
    end
  end

  def index
    @videos = Video.where(:state => :published).all
  end

  def around_location
    distance = params[:distance].present? ? params[:distance].to_i : 2  
    
    @videos = Video.near([params[:longitude].to_f, params[:latitude].to_f], distance).where(:state => :published).all
    if !@videos.empty?
      render :file => 'videos/index'
    else
      @errors = [{:message => "Sorry, no videos available around you!"}]
      render :partial => 'shared/errors'
    end
  end
end
