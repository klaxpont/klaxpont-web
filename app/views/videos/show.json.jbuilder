json.id @video.video_id
json.(@video, :title, :description, :state)
json.location do |json|
  json.latitude @video.latitude
  json.longitude @video.longitude
end
