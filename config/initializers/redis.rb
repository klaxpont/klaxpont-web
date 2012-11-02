redis_settings = YAML.load(ERB.new(File.read(Rails.root.join("config", "redis.yml"))).result)[Rails.env]
if(redis_settings['url'])
  uri = URI.parse(redis_settings['url'])
else
  require 'ostruct'
  uri = OpenStruct.new(:host => redis_settings['host'], :port => redis_settings['port'], :password => redis_settings['password'])
end
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
