Klaxpont::Application.configure do
  config.dailymotion_credentials = YAML.load_file("#{Rails.root}/config/credentials.yml")["dailymotion"]
end