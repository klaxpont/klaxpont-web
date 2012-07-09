class Video
  include Mongoid::Document
  include Geocoder::Model::Mongoid

  field :user_id, type: String
  field :video_id, type: String

  field :title, type: String
  field :description, type: String
  field :state, type: Symbol
  field :embed_html, type: String
  
  field :address
  field :coordinates, :type => Array
  geocoded_by :address   
  # REVIEW: is it necessary ? see geocoded gem doc
  after_validation :geocode 

  reverse_geocoded_by :coordinates
  after_validation :reverse_geocode  # auto-fetch address  
  
  index :video_id, unique: true

  
  # Constants
  STATES = %w{ :published :in_review}


  # Validations
  validates_presence_of :video_id
  validates_uniqueness_of :video_id


end