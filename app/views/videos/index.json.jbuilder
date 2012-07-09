json.array!(@videos) do |json, video|
	json.dailymotion_video_id video.video_id
  json.(video, :title, :description)
  # TODO: replace by real values
  json.location do |json| 	
    json.latitude video.to_coordinates.first
  	json.longitude video.to_coordinates.last
  end
end