class AccessController < ApplicationController

  require "dailymotion_wrapper"

  respond_to :json
  
  def get_token
    @access_token = DailymotionWrapper.get_access_token
  end

end