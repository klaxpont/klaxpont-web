json.response do |body|
  body.partial! "videos/video", video: @video
end