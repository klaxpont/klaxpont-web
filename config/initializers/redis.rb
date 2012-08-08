Klaxpont::Application.configure do
  config.redis_settings = YAML.load(ERB.new(File.read(Rails.root.join("config", "redis.yml"))).result)[Rails.env]
end