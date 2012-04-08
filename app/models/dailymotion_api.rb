class DailymotionApi
  include HTTParty

  base_uri 'https://api.dailymotion.com'
  format :json

  def self.get_videos
    puts "je vis des bas, jeux videos"
    #VIDEOS_URL = "https://api.dailymotion.com/me/videos?access_token=..."
    #get "/me/videos", :query => {:access_token => get_token}
    ""
  end

  def self.get_token(refresh_token)

    # Go with the refresh_token method if `refresh_token` is ok.
    unless refresh_token.to_s.empty?
      puts "go with refresh_token method... "
      response = get_token_by_refresh_token(refresh_token)
    end

    # Go with the password method if `refresh_token` is ko or if the response contains an error.
    if response.nil? or response.has_key? "error"
      puts "go with password method... "
      response = get_token_by_password
    end

    return response
  end


  def self.get_token_by_refresh_token(refresh_token)
    credentials = Klaxpont::Application.config.dailymotion_credentials
    parameters = {
      :grant_type =>    "refresh_token",
      :refresh_token => refresh_token,
      :client_id =>     credentials["client_id"],
      :client_secret => credentials["client_secret"],
      :scope =>         "manage_videos"
    }
    
    post '/oauth/token', :body => parameters
  end


  def self.get_token_by_password
    credentials = Klaxpont::Application.config.dailymotion_credentials
    parameters = {
      :grant_type =>    "password",
      :username =>      credentials["username"],
      :password =>      credentials["password"],
      :client_id =>     credentials["client_id"],
      :client_secret => credentials["client_secret"],
      :scope =>         "manage_videos"
    }

    post '/oauth/token', :body => parameters
  end

end