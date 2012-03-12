class DailymotionApi
  include HTTParty

  base_uri 'https://api.dailymotion.com'
  format :json

  def self.videos
    puts "je vis des bas, jeux videos"
    #get "/me/videos", :query => {:access_token => get_token}
    ""
  end

  def self.get_token
    begin

      # Retrieve the `refresh_token` from the db.
      dailymotion = Dailymotion.first
      unless dailymotion
        dailymotion = Dailymotion.new
      end

      # Go with the refresh_token method if `refresh_token` is ok.
      unless dailymotion.refresh_token.to_s.empty?
        print "go with refresh_token method... "
        response = get_token_by_refresh_token(dailymotion.refresh_token)
      end

      # Go with the password method if `refresh_token` is ko or if the response contains an error.
      if response.nil? or response.has_key? "error"
        print "go with password method... "
        response = get_token_by_password
      end

      unless response.success?
        raise response.response
      end

      # Save the `refresh_token`.
      dailymotion.refresh_token = response["refresh_token"]
      dailymotion.save

      return dailymotion.refresh_token

    rescue Exception => e
      print e.backtrace.join("\n") + "\n"
      print e.message
    end

  end


  private

  def self.get_token_by_refresh_token(refresh_token)
    credentials = Klaxpont::Application.config.dailymotion_credentials
    parameters = {
      :grant_type =>    "refresh_token",
      :client_id =>     credentials["client_id"],
      :client_secret => credentials["client_secret"],
      :refresh_token => refresh_token
    }
    
    post '/oauth/token', :body => parameters
  end


  def self.get_token_by_password
    credentials = Klaxpont::Application.config.dailymotion_credentials
    parameters = {
      :grant_type =>    "password",
      :client_id =>     credentials["client_id"],
      :client_secret => credentials["client_secret"],
      :username =>      credentials["username"],
      :password =>      credentials["password"]
    }

    post '/oauth/token', :body => parameters
  end

end