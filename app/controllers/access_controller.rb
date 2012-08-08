class AccessController < ApplicationController

  require "dailymotion_wrapper"

  respond_to :json

  rescue_from Exception, :with => :error_render_method

  def error_render_method(e)
    print e.backtrace.join("\n") + "\n"
    print e.message
    #TODO use partial instead
    json = { :error => true, :message => e.message }.to_json
    respond_with json
    true
  end


  def get_token
    output = { :access_token => DailymotionWrapper.get_access_token }
    respond_with output.to_json
  end

end