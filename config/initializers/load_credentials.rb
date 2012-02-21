Klaxpont::Application.configure do
  config.dailymotion_credentials = YAML.load(ERB.new(File.read("#{Rails.root}/config/credentials.yml")).result)["dailymotion"]
end