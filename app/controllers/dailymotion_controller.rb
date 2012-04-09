class DailymotionController < ApplicationController
  
  require "json"

  respond_to :json
  

  def get_token
    # Retrieve the `refresh_token` from the db.
    refresh_token = Dailymotion.get_refresh_token

    begin
      response = DailymotionApi.get_token(refresh_token)

      unless response.success?
        raise response.response
      end

      # Save the `refresh_token`.
      Dailymotion.save_refresh_token response["refresh_token"]

      respond_with response.body

    rescue Exception => e
      print e.backtrace.join("\n") + "\n"
      print e.message
      json = { :error => true, :message => e.message }.to_json
      respond_with json
    end

  end


  def get_videos
    response = DailymotionApi.get_videos
    respond_with response.body
  end

end