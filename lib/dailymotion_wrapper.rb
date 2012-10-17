module DailymotionWrapper

  require 'redis'

  module_function

  REDIS_KEY = {
    :access_token  => 'dailymotion:access_token',
    :refresh_token => 'dailymotion:refresh_token'
  }


  def get_access_token
    # Get token from Redis
    access_token = REDIS.get(REDIS_KEY[:access_token])

    if access_token.nil?
      refresh_token = REDIS.get(REDIS_KEY[:refresh_token])

      # Get token from dailymotion
      response = DailymotionApi.get_token(refresh_token)

      seconds      = response["expires_in"]
      access_token = response["access_token"]

      REDIS.multi do
        REDIS.setex REDIS_KEY[:access_token], seconds, access_token
        REDIS.setex REDIS_KEY[:refresh_token], seconds, response["refresh_token"]
      end
    end

    access_token
  end

end