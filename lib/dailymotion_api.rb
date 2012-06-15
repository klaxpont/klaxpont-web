module DailymotionApi
  include HTTParty

  base_uri 'https://api.dailymotion.com'
  format :json

  def self.get_videos(page = 1)
    credentials = Klaxpont::Application.config.dailymotion_credentials
    username = credentials["username"]
    relative_url = "/user/#{username}/videos"
    fields = %w{id description title published embed_html}

    session = get_token
    response = get relative_url, :query => {:access_token => session['access_token'], :fields => fields.join(","), :page => page}

    response.parsed_response
  end

  def self.get_token(refresh_token = '')

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

    response
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
    
    response = post '/oauth/token', :body => parameters
    response.parsed_response
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

    response = post '/oauth/token', :body => parameters
    response.parsed_response
  end

  def self.get_all_videos
    next_page = 1
    begin 
      data = DailymotionApi.get_videos(next_page)
      return unless data
    
      next_page = data["page"].to_i + 1
      parse_videos(data["list"])
    end while data['has_more']
  end

  private
  # TODO move to other class as dailymotion_api could be used in another context
  def self.parse_videos(list)
    return if list.empty?
    list.each do |item|
      video = Video.find_or_initialize_by :video_id => item["id"]
      video.title = item["title"]
      video.description = item["description"]
      video.state = (item["published"]) ? :published : :in_review
      video.embed_html = item["embed_html"]
      if(!video.save)
        Rails.logger.error "Failed to saved video #{item['id']}"
      end
    end
  end

end