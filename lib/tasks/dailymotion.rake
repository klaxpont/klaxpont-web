require "dailymotion_api"
namespace :dailymotion do
	desc "retrieve videos from Dailymotion with database"
	task :videos do
		DailymotionApi.get_all_videos
	end
end
