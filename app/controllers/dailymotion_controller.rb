class DailymotionController < ApplicationController
  
  require "net/https"
  require "uri"
  require "json"

  

  TOKEN_REFRESH_URL = "https://api.dailymotion.com/oauth/token"
  VIDEOS_URL = "https://api.dailymotion.com/me/videos?access_token=..."


  respond_to :json
  

  def get_token
    begin

      # Retrieve the `refresh_token` from the db.
      dailymotion = Dailymotion.first
      unless dailymotion
        dailymotion = Dailymotion.new
      end

      # Go with the refresh_token method if `refresh_token` is ok.
      unless dailymotion.refresh_token.to_s.empty?
        print "go with refresh_token method... "
        json = get_token_by_refresh_token(dailymotion.refresh_token)
      end

      # Go with the password method if `refresh_token` is ko or if the response contains an error.
      if json.nil? or JSON.parse(json).has_key? "error"
        print "go with password method... "
        json = get_token_by_password
      end

      # Save the `refresh_token`.
      dailymotion.refresh_token = JSON.parse(json)["refresh_token"]
      dailymotion.save
      print "json: " + json + "\n"

    rescue Exception => e
      print e.backtrace.join("\n") + "\n"
      print e.message
      json = { :error => true, :message => e.message }.to_json
    end

    respond_with json
  end


  def get_videos
    get_request(VIDEOS_URL)
  end


  private

  def get_token_by_refresh_token(refresh_token)
    credentials = Klaxpont::Application.config.dailymotion_credentials
    parameters = {
      :grant_type =>    "refresh_token",
      :client_id =>     credentials["client_id"],
      :client_secret => credentials["client_secret"],
      :refresh_token => refresh_token
    }
    
    do_post_request(parameters)
  end


  def get_token_by_password
    credentials = Klaxpont::Application.config.dailymotion_credentials
    parameters = {
      :grant_type =>    "password",
      :client_id =>     credentials["client_id"],
      :client_secret => credentials["client_secret"],
      :username =>      credentials["username"],
      :password =>      credentials["password"]
    }

    do_post_request(parameters)
  end


  def do_post_request(parameters)
    uri = URI.parse(TOKEN_REFRESH_URL)

    request = Net::HTTP::Post.new(uri.request_uri)
    request.form_data = parameters

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    #response = con.start { |http| http.request(req) }
    http.request(request).body
  end

  def do_get_request(url, parameters)
    uri = URI.parse(url)

    request = Net::HTTP::Get.new(uri.request_uri)
    # request.form_data = parameters
    
    get_http.request(request).body
  end

  def get_http
    unless @http
      @http = Net::HTTP.new(URL_DAILYMOTION)
      @http.use_ssl = true
      @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end
    @http
  end

end