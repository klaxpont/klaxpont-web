class AccessController < ApplicationController

  require "dailymotion_wrapper"

  respond_to :json

  def get_token
    @access_token = DailymotionWrapper.get_access_token

    credentials = Klaxpont::Application.config.dailymotion_credentials
    @api_key = credentials["client_id"]
    @api_secret = credentials["client_secret"]
  end

end
