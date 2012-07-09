Klaxpont::Application.configure do
  config.dailymotion_credentials = YAML.load(ERB.new(File.read("#{Rails.root}/config/credentials.yml")).result)["dailymotion"]

  config.dailymotion_credentials.each do |k,v|
  	if v.nil? or v.empty?
		  raise "daylimotion credentials '#{k}' is invalid" unless Rails.env.test?
  	end
  end
end