json.array!(@videos) do |json, video|
	json.id video.video_id
  json.(video, :title, :description)
end