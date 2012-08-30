json.dailymotion_video_id @video.video_id
json.(@video, :id, :title, :description, :state)
json.location do |json|
  json.latitude @video.to_coordinates.first
  json.longitude @video.to_coordinates.last
end
