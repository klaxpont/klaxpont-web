class Video
  include Mongoid::Document

  field :user_id, type: String
  field :video_id, type: String

  field :title, type: String
  field :description, type: String
  field :state, type: Symbol
  field :embed_html, type: String

  field :latitude, type: Float
  field :longitude, type: Float
  # geocoded_by :address
  # after_validation :geocode, :if => :address_changed?
  
  index :video_id, unique: true

  
  # Constants
  STATES = %w{ :published :in_review}


end