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
  # REVIEW: is it necessary ? see geocoded gem doc
  # geocoded_by :address
  # after_validation :geocode, :if => :address_changed?
  
  index :video_id, unique: true

  
  # Constants
  STATES = %w{ :published :in_review}


  # Validations
  validates_presence_of :video_id
  validates_uniqueness_of :video_id
end