json.dailymotion_video_id video.video_id
json.video_url video.swf_url 
json.(video, :id, :title, :thumbnail_url )
json.location do |json|
  json.latitude video.to_coordinates.first
  json.longitude video.to_coordinates.last
end
