class DailymotionController < ApplicationController
  
  require "json"
  respond_to :json

  rescue_from Exception, :with => :error_render_method

  def error_render_method(e)
    print e.backtrace.join("\n") + "\n"
    print e.message
    json = { :error => true, :message => e.message }.to_json
    respond_with json
    true
  end
  

  def get_token
    # Retrieve the `refresh_token` from the db.
    refresh_token = Dailymotion.get_refresh_token

    response = DailymotionApi.get_token(refresh_token)

    # unless response.success?
    #   raise Exception.new response.response
    # end

    # Save the `refresh_token`.
    Dailymotion.save_refresh_token response["refresh_token"]

    respond_with response.body
  end


  def get_videos
    response = DailymotionApi.get_videos
    respond_with response.body
  end

end