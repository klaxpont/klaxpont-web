class Video
  include Mongoid::Document

  field :user_id, type: String
  field :video_id, type: String

  index :video_id, unique: true 

end