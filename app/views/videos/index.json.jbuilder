json.array!(@videos) do |json, video|
	json.id video.video_id
  json.(video, :title, :description)
  # TODO replace by real values
  json.location do |json|
  	json.latitude 40.5
  	json.longitude 42.2
  end
end