json.response do |body|
  body.array!(@videos) do |json, video|
  	json.partial! "videos/video", video: video
  end
end