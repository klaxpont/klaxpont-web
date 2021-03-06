class VideosController < ApplicationController

  respond_to :json

  def create
    # Get the video_id and the user_id
    # Associate them.
    @video = Video.find_or_initialize_by :video_id => params[:video_id], :user_id => params[:user_id]
    # OPTIMIZE: this is shit .to_coordinates vs coordinates
    @video.coordinates = [params[:longitude].to_f,params[:latitude].to_f,]

    @video.state = :in_review
    if !@video.save
      error_render_method @video.errors.first
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
      render_error("Sorry, no videos available around you!", 400)
    end
  end
end
